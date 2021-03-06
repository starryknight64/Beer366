package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * UserController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def home() {
		def homepage = springSecurityService.currentUser.homepage
        redirect( url: createLink(uri: homepage ? "/${homepage}" : "/", absolute:true) )
	}

    def index() {
        if( params.sanitizedUsername ) {
            def user = User.findBySanitizedUsername( params.sanitizedUsername?.asFriendlyUrl() )
            if( user ) {
                redirect(action: "show", params: [id: user.id])
            } else {
                redirect(controller: "search", params: [q: params.sanitizedUsername])
            }
        } else {
            redirect(action: "list", params: params)
        }
    }

    def list() {
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
		params.enabled = true
		params.password = "beer366"
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show() {
        redirect(action: "totals", params: params)
    }

    def updateHomepage() {
        def userInstance = springSecurityService.currentUser
        if (!userInstance.isAttached()) {
            userInstance.attach()
        }
        def baseURL = createLink(uri:'/', absolute:true)
        def referer = request.getHeader('referer')
        if( referer.toLowerCase().startsWith( baseURL.toLowerCase() ) ) {
			def home = referer.replace(baseURL,"")
            userInstance.homepage = home ? "/${home}" : null
            userInstance.save(flush:true)
            redirect( uri: request.getHeader('referer') )
            return
        }
        redirect( url: baseURL )
    }

    def totals() {
        def userInstance = params.id ? User.get( params.id ) : springSecurityService.currentUser
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def uniques() {
        def userInstance = params.id ? User.get( params.id ) : springSecurityService.currentUser
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def completelog() {
        def userInstance = params.id ? User.get( params.id ) : springSecurityService.currentUser
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def info() {
        def userInstance = springSecurityService.currentUser
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "show")
            return
        }

        if( userInstance.id != springSecurityService.currentUser.id ) {
            flash.message = "You are not allowed to edit another user's credentials!"
            redirect(action: "edit", id: springSecurityService.currentUser.id)
            return
        }

        [userInstance: userInstance]
    }

    def update() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        springSecurityService.reauthenticate( userInstance.username )
        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete() {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
