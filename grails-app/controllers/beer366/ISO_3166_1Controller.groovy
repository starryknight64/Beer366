package beer366

import org.springframework.dao.DataIntegrityViolationException

/**
 * ISO_3166_1Controller
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ISO_3166_1Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ISO_3166_1InstanceList: ISO_3166_1.list(params), ISO_3166_1InstanceTotal: ISO_3166_1.count()]
    }

    def create() {
        [ISO_3166_1Instance: new ISO_3166_1(params)]
    }

    def save() {
        def ISO_3166_1Instance = new ISO_3166_1(params)
        if (!ISO_3166_1Instance.save(flush: true)) {
            render(view: "create", model: [ISO_3166_1Instance: ISO_3166_1Instance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), ISO_3166_1Instance.id])
        redirect(action: "show", id: ISO_3166_1Instance.id)
    }

    def show() {
        def ISO_3166_1Instance = ISO_3166_1.get(params.id)
        if (!ISO_3166_1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), params.id])
            redirect(action: "list")
            return
        }

        [ISO_3166_1Instance: ISO_3166_1Instance]
    }

    def edit() {
        def ISO_3166_1Instance = ISO_3166_1.get(params.id)
        if (!ISO_3166_1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), params.id])
            redirect(action: "list")
            return
        }

        [ISO_3166_1Instance: ISO_3166_1Instance]
    }

    def update() {
        def ISO_3166_1Instance = ISO_3166_1.get(params.id)
        if (!ISO_3166_1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ISO_3166_1Instance.version > version) {
                ISO_3166_1Instance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1')] as Object[],
                          "Another user has updated this ISO_3166_1 while you were editing")
                render(view: "edit", model: [ISO_3166_1Instance: ISO_3166_1Instance])
                return
            }
        }

        ISO_3166_1Instance.properties = params

        if (!ISO_3166_1Instance.save(flush: true)) {
            render(view: "edit", model: [ISO_3166_1Instance: ISO_3166_1Instance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), ISO_3166_1Instance.id])
        redirect(action: "show", id: ISO_3166_1Instance.id)
    }

    def delete() {
        def ISO_3166_1Instance = ISO_3166_1.get(params.id)
        if (!ISO_3166_1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ISO_3166_1Instance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ISO_3166_1.label', default: 'ISO_3166_1'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
