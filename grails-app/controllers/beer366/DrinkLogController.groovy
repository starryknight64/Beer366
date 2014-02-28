package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * DrinkLogController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DrinkLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        redirect(controller: "user", action: "completelog", params: params)
    }

    def create() {
        def drinkLogCreate = [:]
        if( params.fromCellar ) {
            drinkLogCreate.cellarID = params.id
            params.beer = Cellar.get( params.id )?.beer
        } else {
            params.beer = Beer.get( params.id )
        }
        drinkLogCreate.cellarList = Cellar.findAllByUser( springSecurityService.currentUser )
        drinkLogCreate.drinkLogInstance = new DrinkLog(params)
        return drinkLogCreate
    }

    def save() {
        def drinkLogInstance = new DrinkLog(params)
        if (!drinkLogInstance.save(flush: true)) {
            render(view: "create", model: [drinkLogInstance: drinkLogInstance])
            return
        }

        def sizeName = drinkLogInstance.size.name.toLowerCase()
        def beer = drinkLogInstance.beer
        flash.message = "Successfully logged ${sizeName.charAt(0).isDigit() ? "" : "a "}${sizeName} of a ${beer.brewery} ${beer.name}"

        if( params.cellarID ) {
            def cellarInstance = Cellar.get( params.cellarID )
            if( cellarInstance ) {
                if( cellarInstance.quantity <= 1 ) {
                    cellarInstance.delete(flush: true)
                } else {
                    cellarInstance.quantity--
                    if( cellarInstance.willTrade > cellarInstance.quantity ) {
                        cellarInstance.willTrade = cellarInstance.quantity
                    }
                    cellarInstance.save(flush: true)
                }
            }
            redirect(controller: "cellar", action: "list")
            return
        }

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
		if( springSecurityService.currentUser.id != drinkLogInstance.user.id ) {
			redirect(action: "list")
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
