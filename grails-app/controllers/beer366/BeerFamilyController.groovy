package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * BeerFamilyController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BeerFamilyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [beerFamilyInstanceList: BeerFamily.list(params), beerFamilyInstanceTotal: BeerFamily.count()]
    }

    def create() {
        [beerFamilyInstance: new BeerFamily(params)]
    }

    def save() {
        def beerFamilyInstance = new BeerFamily(params)
        if (!beerFamilyInstance.save(flush: true)) {
            render(view: "create", model: [beerFamilyInstance: beerFamilyInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), beerFamilyInstance.id])
        redirect(action: "show", id: beerFamilyInstance.id)
    }

    def show() {
        def beerFamilyInstance = BeerFamily.get(params.id)
        if (!beerFamilyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), params.id])
            redirect(action: "list")
            return
        }

        [beerFamilyInstance: beerFamilyInstance]
    }

    def edit() {
        def beerFamilyInstance = BeerFamily.get(params.id)
        if (!beerFamilyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), params.id])
            redirect(action: "list")
            return
        }

        [beerFamilyInstance: beerFamilyInstance]
    }

    def update() {
        def beerFamilyInstance = BeerFamily.get(params.id)
        if (!beerFamilyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (beerFamilyInstance.version > version) {
                beerFamilyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'beerFamily.label', default: 'BeerFamily')] as Object[],
                          "Another user has updated this BeerFamily while you were editing")
                render(view: "edit", model: [beerFamilyInstance: beerFamilyInstance])
                return
            }
        }

        beerFamilyInstance.properties = params

        if (!beerFamilyInstance.save(flush: true)) {
            render(view: "edit", model: [beerFamilyInstance: beerFamilyInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), beerFamilyInstance.id])
        redirect(action: "show", id: beerFamilyInstance.id)
    }

    def delete() {
        def beerFamilyInstance = BeerFamily.get(params.id)
        if (!beerFamilyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), params.id])
            redirect(action: "list")
            return
        }

        try {
            beerFamilyInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beerFamily.label', default: 'BeerFamily'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
