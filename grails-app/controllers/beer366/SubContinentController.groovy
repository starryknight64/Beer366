package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * SubContinentController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SubContinentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [subContinentInstanceList: SubContinent.list(params), subContinentInstanceTotal: SubContinent.count()]
    }

    def create() {
        [subContinentInstance: new SubContinent(params)]
    }

    def save() {
        def subContinentInstance = new SubContinent(params)
        if (!subContinentInstance.save(flush: true)) {
            render(view: "create", model: [subContinentInstance: subContinentInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), subContinentInstance.id])
        redirect(action: "show", id: subContinentInstance.id)
    }

    def show() {
        def subContinentInstance = SubContinent.get(params.id)
        if (!subContinentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), params.id])
            redirect(action: "list")
            return
        }

        [subContinentInstance: subContinentInstance]
    }

    def edit() {
        def subContinentInstance = SubContinent.get(params.id)
        if (!subContinentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), params.id])
            redirect(action: "list")
            return
        }

        [subContinentInstance: subContinentInstance]
    }

    def update() {
        def subContinentInstance = SubContinent.get(params.id)
        if (!subContinentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (subContinentInstance.version > version) {
                subContinentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subContinent.label', default: 'SubContinent')] as Object[],
                          "Another user has updated this SubContinent while you were editing")
                render(view: "edit", model: [subContinentInstance: subContinentInstance])
                return
            }
        }

        subContinentInstance.properties = params

        if (!subContinentInstance.save(flush: true)) {
            render(view: "edit", model: [subContinentInstance: subContinentInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), subContinentInstance.id])
        redirect(action: "show", id: subContinentInstance.id)
    }

    def delete() {
        def subContinentInstance = SubContinent.get(params.id)
        if (!subContinentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), params.id])
            redirect(action: "list")
            return
        }

        try {
            subContinentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subContinent.label', default: 'SubContinent'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
