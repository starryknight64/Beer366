package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * BreweryController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BreweryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [breweryInstanceList: Brewery.list(params), breweryInstanceTotal: Brewery.count()]
    }

    def create() {
        [breweryInstance: new Brewery(params)]
    }

    def save() {
        def breweryInstance = new Brewery(params)
        if (!breweryInstance.save(flush: true)) {
            render(view: "create", model: [breweryInstance: breweryInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'brewery.label', default: 'Brewery'), breweryInstance.id])
        redirect(action: "show", id: breweryInstance.id)
    }

    def show() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        [breweryInstance: breweryInstance]
    }

    def edit() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        [breweryInstance: breweryInstance]
    }

    def update() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (breweryInstance.version > version) {
                breweryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'brewery.label', default: 'Brewery')] as Object[],
                          "Another user has updated this Brewery while you were editing")
                render(view: "edit", model: [breweryInstance: breweryInstance])
                return
            }
        }

        breweryInstance.properties = params

        if (!breweryInstance.save(flush: true)) {
            render(view: "edit", model: [breweryInstance: breweryInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'brewery.label', default: 'Brewery'), breweryInstance.id])
        redirect(action: "show", id: breweryInstance.id)
    }

    def delete() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        try {
            breweryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
