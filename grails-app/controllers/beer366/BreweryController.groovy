package beer366

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

/**
 * BreweryController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class BreweryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [breweryInstanceList: Brewery.list(params), breweryInstanceTotal: Brewery.count()]
    }

    def locations() {
        if( params.state ) {
            params.region = ISO_3166_2.get( params.state )?.code
            params.resolution = "provinces"
        } else if( params.country ) {
            def country = ISO_3166_1.get( params.country )
            params.region = country?.alpha2
            params.resolution = country.isUSA() ? "provinces" : "countries"
        } else if( params.subcontinent ) {
            params.region = SubContinent.get( params.subcontinent )?.code
            params.resolution = "countries"
        } else if( params.continent ) {
            params.region = Continent.get( params.continent )?.code
            params.resolution = "countries"
        }
        [params: params]
    }

    def locationCount() {
        def m = [   "places": [],
                    "urls": [],
                    "region": "world"]
        if( params.state ) {
            m.displayMode = "markers"
            def state = ISO_3166_2.get( params.state )
            Brewery.findAllByRegion( state ).city.unique().each{ city ->
                m.places.push( [city, Brewery.countByCity( city )] )
                def url = "${grailsApplication.config.grails.serverURL}/brewery/list?state=${state.id}&city=${city}"
                m.urls.push( url )
            }
        } else if( params.country ) {
            def country = ISO_3166_1.get( params.country )
            if( country?.isUSA() ) {
                ISO_3166_2.list().each{ state ->
                    def count = Brewery.countByRegion( state )
                    if( count > 0 ) {
                        m.places.push( [state.name, count] )
                        def url = "${grailsApplication.config.grails.serverURL}/brewery/locations?state=${state.id}"
                        m.urls.push( url )
                    }
                }
            } else {
                m.displayMode = "markers"
                Brewery.findAllByCountry( country ).city.unique().each{ city ->
                    m.places.push( [city, Brewery.countByCity( city )] )
                    def url = "${grailsApplication.config.grails.serverURL}/brewery/list?country=${country.id}&city=${city}"
                    m.urls.push( url )
                }
            }
        } else {
            ISO_3166_1.list().each{ country ->
                def count = Brewery.countByCountry( country )
                if( count > 0 ) {
                    m.places.push( [country.name, count] )
                    def url = "${grailsApplication.config.grails.serverURL}/brewery/locations?country=${country.id}"
                    m.urls.push( url )
                }
            }
        }
        render m as JSON
    }

    def create() {
        [breweryInstance: new Brewery(params)]
    }

    def save() {
        def breweryInstance = new Brewery(params)
        if (!breweryInstance.save(flush: true)) {
            render(view: "create", model: [breweryInstance: breweryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brewery.label', default: 'Brewery'), breweryInstance.id])
        redirect(action: "show", id: breweryInstance.id)
    }

    def show() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        [breweryInstance: breweryInstance]
    }

    def edit() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        [breweryInstance: breweryInstance]
    }

    def update() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (breweryInstance.version > version) {
                breweryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'brewery.label', default: 'Brewery')] as Object[],
                          "Another user has updated this Brewery while you were editing")
                render(view: "edit", model: [breweryInstance: breweryInstance])
                return
            }
        }

        breweryInstance.properties = params

        if (!breweryInstance.save(flush: true)) {
            render(view: "edit", model: [breweryInstance: breweryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brewery.label', default: 'Brewery'), breweryInstance.id])
        redirect(action: "show", id: breweryInstance.id)
    }

    def delete() {
        def breweryInstance = Brewery.get(params.id)
        if (!breweryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
            return
        }

        try {
            breweryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brewery.label', default: 'Brewery'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
