package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * BeerSubStyleController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BeerSubStyleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [beerSubStyleInstanceList: BeerSubStyle.list(params), beerSubStyleInstanceTotal: BeerSubStyle.count()]
    }

    def create() {
        [beerSubStyleInstance: new BeerSubStyle(params)]
    }

    def save() {
        def beerSubStyleInstance = new BeerSubStyle(params)
        if (!beerSubStyleInstance.save(flush: true)) {
            render(view: "create", model: [beerSubStyleInstance: beerSubStyleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), beerSubStyleInstance.id])
        redirect(action: "show", id: beerSubStyleInstance.id)
    }

    def show() {
        def beerSubStyleInstance = BeerSubStyle.get(params.id)
        if (!beerSubStyleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), params.id])
            redirect(action: "list")
            return
        }

        [beerSubStyleInstance: beerSubStyleInstance]
    }

    def edit() {
        def beerSubStyleInstance = BeerSubStyle.get(params.id)
        if (!beerSubStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), params.id])
            redirect(action: "list")
            return
        }

        [beerSubStyleInstance: beerSubStyleInstance]
    }

    def update() {
        def beerSubStyleInstance = BeerSubStyle.get(params.id)
        if (!beerSubStyleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (beerSubStyleInstance.version > version) {
                beerSubStyleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'beerSubStyle.label', default: 'BeerSubStyle')] as Object[],
                          "Another user has updated this BeerSubStyle while you were editing")
                render(view: "edit", model: [beerSubStyleInstance: beerSubStyleInstance])
                return
            }
        }

        beerSubStyleInstance.properties = params

        if (!beerSubStyleInstance.save(flush: true)) {
            render(view: "edit", model: [beerSubStyleInstance: beerSubStyleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), beerSubStyleInstance.id])
        redirect(action: "show", id: beerSubStyleInstance.id)
    }

    def delete() {
        def beerSubStyleInstance = BeerSubStyle.get(params.id)
        if (!beerSubStyleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), params.id])
            redirect(action: "list")
            return
        }

        try {
            beerSubStyleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'beerSubStyle.label', default: 'BeerSubStyle'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
