package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * BreweryTypeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BreweryTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [breweryTypeInstanceList: BreweryType.list(params), breweryTypeInstanceTotal: BreweryType.count()]
    }

    def create() {
        [breweryTypeInstance: new BreweryType(params)]
    }

    def save() {
        def breweryTypeInstance = new BreweryType(params)
        if (!breweryTypeInstance.save(flush: true)) {
            render(view: "create", model: [breweryTypeInstance: breweryTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), breweryTypeInstance.id])
        redirect(action: "show", id: breweryTypeInstance.id)
    }

    def show() {
        def breweryTypeInstance = BreweryType.get(params.id)
        if (!breweryTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), params.id])
            redirect(action: "list")
            return
        }

        [breweryTypeInstance: breweryTypeInstance]
    }

    def edit() {
        def breweryTypeInstance = BreweryType.get(params.id)
        if (!breweryTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), params.id])
            redirect(action: "list")
            return
        }

        [breweryTypeInstance: breweryTypeInstance]
    }

    def update() {
        def breweryTypeInstance = BreweryType.get(params.id)
        if (!breweryTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (breweryTypeInstance.version > version) {
                breweryTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'breweryType.label', default: 'BreweryType')] as Object[],
                          "Another user has updated this BreweryType while you were editing")
                render(view: "edit", model: [breweryTypeInstance: breweryTypeInstance])
                return
            }
        }

        breweryTypeInstance.properties = params

        if (!breweryTypeInstance.save(flush: true)) {
            render(view: "edit", model: [breweryTypeInstance: breweryTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), breweryTypeInstance.id])
        redirect(action: "show", id: breweryTypeInstance.id)
    }

    def delete() {
        def breweryTypeInstance = BreweryType.get(params.id)
        if (!breweryTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            breweryTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'breweryType.label', default: 'BreweryType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
