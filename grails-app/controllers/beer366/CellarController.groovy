package beer366

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

/**
 * CellarController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CellarController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def get( Long id ) {
		render Cellar.get( id ) as JSON
	}

    def list() {
        def user = params.id ? User.get( params.id ) : springSecurityService.currentUser
        if( params.max ) {
            params.remove( "max" )
        }
        [cellarInstanceList: Cellar.findAllByUser( user, params ), cellarUser: user]
    }

    def create() {
        params.beer = Beer.get( params.id )
        [cellarInstance: new Cellar(params)]
    }

    def save() {
        def cellarInstance = new Cellar(params)
        if (!cellarInstance.save(flush: true)) {
            render(view: "create", model: [cellarInstance: cellarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cellar.label', default: 'Cellar'), cellarInstance.id])
        redirect(action: "show", id: cellarInstance.id)
    }

    def show() {
        redirect(action: "list")
    }

    def edit() {
        def cellarInstance = Cellar.get(params.id)
        if (!cellarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellar.label', default: 'Cellar'), params.id])
            redirect(action: "list")
            return
        }

        [cellarInstance: cellarInstance]
    }

    def update() {
        def cellarInstance = Cellar.get(params.id)
        if (!cellarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellar.label', default: 'Cellar'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cellarInstance.version > version) {
                cellarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'cellar.label', default: 'Cellar')] as Object[],
                          "Another user has updated this Cellar while you were editing")
                render(view: "edit", model: [cellarInstance: cellarInstance])
                return
            }
        }

        cellarInstance.properties = params

        if (!cellarInstance.save(flush: true)) {
            render(view: "edit", model: [cellarInstance: cellarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cellar.label', default: 'Cellar'), cellarInstance.id])
        redirect(action: "show", id: cellarInstance.id)
    }

    def delete() {
        def cellarInstance = Cellar.get(params.id)
        if (!cellarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cellar.label', default: 'Cellar'), params.id])
            redirect(action: "list")
            return
        }

        if( cellarInstance.user != springSecurityService.currentUser ) {
            flash.message = message(code: 'default.permission.not.allowed.message')
            redirect(action: "list")
            return
        }

        try {
            cellarInstance.delete(flush: true)
            flash.message = "Removed beer '${cellarInstance.beer}' from your cellar."
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cellar.label', default: 'Cellar'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
