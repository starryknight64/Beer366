package beer366

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

/**
 * BeerController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BeerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        if( params.sanitizedName ) {
            def beer = Beer.findBySanitizedName( params.sanitizedName )
            if( beer ) {
                redirect(action: "show", params: [id: beer.id])
            } else {
                redirect(controller: "search", params: [q: params.sanitizedName])
            }
        } else {
            redirect(action: "list", params: params)
        }
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [beerInstanceList: Beer.list(params), beerInstanceTotal: Beer.count()]
    }

    def breweryBeers() {
        def m = Beer.findAllByBrewery( Brewery.get( params.breweryid ) )
        render m as JSON
    }

    def create() {
        [beerInstance: new Beer(params)]
    }

    def save() {
        def beerInstance = new Beer(params)
        if (!beerInstance.save(flush: true)) {
            render(view: "create", model: [beerInstance: beerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'beer.label', default: 'Beer'), beerInstance.id])
        redirect(action: "show", id: beerInstance.id)
    }

    def show() {
        def beerInstance = Beer.get(params.id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), params.id])
            redirect(action: "list")
            return
        }

        [beerInstance: beerInstance]
    }

    def edit() {
        def beerInstance = Beer.get(params.id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), params.id])
            redirect(action: "list")
            return
        }

        [beerInstance: beerInstance]
    }

    def update() {
        def beerInstance = Beer.get(params.id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (beerInstance.version > version) {
                beerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'beer.label', default: 'Beer')] as Object[],
                          "Another user has updated this Beer while you were editing")
                render(view: "edit", model: [beerInstance: beerInstance])
                return
            }
        }

        beerInstance.properties = params

        if (!beerInstance.save(flush: true)) {
            render(view: "edit", model: [beerInstance: beerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'beer.label', default: 'Beer'), beerInstance.id])
        redirect(action: "show", id: beerInstance.id)
    }

    def delete() {
        def beerInstance = Beer.get(params.id)
        if (!beerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beer.label', default: 'Beer'), params.id])
            redirect(action: "list")
            return
        }

        try {
            beerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'beer.label', default: 'Beer'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beer.label', default: 'Beer'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
