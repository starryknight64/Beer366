package beer366

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

/**
 * BeerStyleController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BeerStyleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [beerStyleInstanceList: BeerStyle.list(params), beerStyleInstanceTotal: BeerStyle.count()]
    }

    def familyStyles() {
        def familyID = params.familyid
        def m = []
        if( familyID == "all" ) {
            m = BeerStyle.list()
        } else {
            m = BeerStyle.findAllByFamily( BeerFamily.get(familyID) )
        }
        render m as JSON
    }

    def create() {
        [beerStyleInstance: new BeerStyle(params)]
    }

    def save() {
        def beerStyleInstance = new BeerStyle(params)
        if (!beerStyleInstance.save(flush: true)) {
            render(view: "create", model: [beerStyleInstance: beerStyleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), beerStyleInstance.id])
        redirect(action: "show", id: beerStyleInstance.id)
    }

    def show() {
        def beerStyleInstance = BeerStyle.get(params.id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), params.id])
            redirect(action: "list")
            return
        }

        [beerStyleInstance: beerStyleInstance]
    }

    def edit() {
        def beerStyleInstance = BeerStyle.get(params.id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), params.id])
            redirect(action: "list")
            return
        }

        [beerStyleInstance: beerStyleInstance]
    }

    def update() {
        def beerStyleInstance = BeerStyle.get(params.id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (beerStyleInstance.version > version) {
                beerStyleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'beerStyle.label', default: 'BeerStyle')] as Object[],
                          "Another user has updated this BeerStyle while you were editing")
                render(view: "edit", model: [beerStyleInstance: beerStyleInstance])
                return
            }
        }

        beerStyleInstance.properties = params

        if (!beerStyleInstance.save(flush: true)) {
            render(view: "edit", model: [beerStyleInstance: beerStyleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), beerStyleInstance.id])
        redirect(action: "show", id: beerStyleInstance.id)
    }

    def delete() {
        def beerStyleInstance = BeerStyle.get(params.id)
        if (!beerStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), params.id])
            redirect(action: "list")
            return
        }

        try {
            beerStyleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beerStyle.label', default: 'BeerStyle'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
