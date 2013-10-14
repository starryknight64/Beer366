package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * DrinkLogController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DrinkLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        redirect(controller: "user", action: "completelog", params: params)
    }

    def create() {
        params.beer = Beer.get( params.id )
        [drinkLogInstance: new DrinkLog(params)]
    }

    def save() {
        def drinkLogInstance = new DrinkLog(params)
        if (!drinkLogInstance.save(flush: true)) {
            render(view: "create", model: [drinkLogInstance: drinkLogInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), drinkLogInstance.id])
        redirect(action: "show", id: drinkLogInstance.id)
    }

    def show() {
        redirect(controller: "home", action: "index")
    }

    def edit() {
        def drinkLogInstance = DrinkLog.get(params.id)
        if (!drinkLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), params.id])
            redirect(action: "list")
            return
        }

        [drinkLogInstance: drinkLogInstance]
    }

    def update() {
        def drinkLogInstance = DrinkLog.get(params.id)
        if (!drinkLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (drinkLogInstance.version > version) {
                drinkLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'drinkLog.label', default: 'DrinkLog')] as Object[],
                          "Another user has updated this DrinkLog while you were editing")
                render(view: "edit", model: [drinkLogInstance: drinkLogInstance])
                return
            }
        }

        drinkLogInstance.properties = params

        if (!drinkLogInstance.save(flush: true)) {
            render(view: "edit", model: [drinkLogInstance: drinkLogInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), drinkLogInstance.id])
        redirect(action: "show", id: drinkLogInstance.id)
    }

    def delete() {
        def drinkLogInstance = DrinkLog.get(params.id)
        if (!drinkLogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), params.id])
            redirect(action: "list")
            return
        }

        try {
            drinkLogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'drinkLog.label', default: 'DrinkLog'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
