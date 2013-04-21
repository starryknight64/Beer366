package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * ContinentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ContinentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [continentInstanceList: Continent.list(params), continentInstanceTotal: Continent.count()]
    }

    def create() {
        [continentInstance: new Continent(params)]
    }

    def save() {
        def continentInstance = new Continent(params)
        if (!continentInstance.save(flush: true)) {
            render(view: "create", model: [continentInstance: continentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'continent.label', default: 'Continent'), continentInstance.id])
        redirect(action: "show", id: continentInstance.id)
    }

    def show() {
        def continentInstance = Continent.get(params.id)
        if (!continentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
            redirect(action: "list")
            return
        }

        [continentInstance: continentInstance]
    }

    def edit() {
        def continentInstance = Continent.get(params.id)
        if (!continentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
            redirect(action: "list")
            return
        }

        [continentInstance: continentInstance]
    }

    def update() {
        def continentInstance = Continent.get(params.id)
        if (!continentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (continentInstance.version > version) {
                continentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'continent.label', default: 'Continent')] as Object[],
                          "Another user has updated this Continent while you were editing")
                render(view: "edit", model: [continentInstance: continentInstance])
                return
            }
        }

        continentInstance.properties = params

        if (!continentInstance.save(flush: true)) {
            render(view: "edit", model: [continentInstance: continentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'continent.label', default: 'Continent'), continentInstance.id])
        redirect(action: "show", id: continentInstance.id)
    }

    def delete() {
        def continentInstance = Continent.get(params.id)
        if (!continentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
            redirect(action: "list")
            return
        }

        try {
            continentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'continent.label', default: 'Continent'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
