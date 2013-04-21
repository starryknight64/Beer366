package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * ServingSizeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ServingSizeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [servingSizeInstanceList: ServingSize.list(params), servingSizeInstanceTotal: ServingSize.count()]
    }

    def create() {
        [servingSizeInstance: new ServingSize(params)]
    }

    def save() {
        def servingSizeInstance = new ServingSize(params)
        if (!servingSizeInstance.save(flush: true)) {
            render(view: "create", model: [servingSizeInstance: servingSizeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), servingSizeInstance.id])
        redirect(action: "show", id: servingSizeInstance.id)
    }

    def show() {
        def servingSizeInstance = ServingSize.get(params.id)
        if (!servingSizeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), params.id])
            redirect(action: "list")
            return
        }

        [servingSizeInstance: servingSizeInstance]
    }

    def edit() {
        def servingSizeInstance = ServingSize.get(params.id)
        if (!servingSizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), params.id])
            redirect(action: "list")
            return
        }

        [servingSizeInstance: servingSizeInstance]
    }

    def update() {
        def servingSizeInstance = ServingSize.get(params.id)
        if (!servingSizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (servingSizeInstance.version > version) {
                servingSizeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'servingSize.label', default: 'ServingSize')] as Object[],
                          "Another user has updated this ServingSize while you were editing")
                render(view: "edit", model: [servingSizeInstance: servingSizeInstance])
                return
            }
        }

        servingSizeInstance.properties = params

        if (!servingSizeInstance.save(flush: true)) {
            render(view: "edit", model: [servingSizeInstance: servingSizeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), servingSizeInstance.id])
        redirect(action: "show", id: servingSizeInstance.id)
    }

    def delete() {
        def servingSizeInstance = ServingSize.get(params.id)
        if (!servingSizeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), params.id])
            redirect(action: "list")
            return
        }

        try {
            servingSizeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'servingSize.label', default: 'ServingSize'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
