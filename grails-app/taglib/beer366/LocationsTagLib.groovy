package beer366

/**
 * LocationsTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class LocationsTagLib {
    static namespace = "b"

    def renderBreadcrumbs = { attrs ->
        def params = attrs.params
        def baseURL = "${grailsApplication.config.grails.serverURL}"
        def state = attrs.state
        def country = attrs.country
        def subContinent = attrs.subcontinent
        def continent = attrs.continent
        if( state ) {
            country = state.country
            subContinent = country.subContinent
            continent = subContinent.continent
        } else if( country ) {
            subContinent = country.subContinent
            continent = subContinent.continent
        } else if( subcontinent ) {
            continent = subContinent.continent
        }

        if( continent || subContinent || country || state ) {
            out << "<ul class='breadcrumb'>"
            out << "<li>"
            out << "<a href='${baseURL}/brewery/locations'>Countries</a>"
            out << "<span class='divider'>/</span>"
            out << "</li>"
            out << "<li>"
            out << "<a href='${baseURL}/brewery/locations?continent=${continent.id}'>${continent.name}</a>"
            out << "</li>"
            if( subContinent ) {
                out << "<span class='divider'>/</span>"
                out << "<li>"
                out << "<a href='${baseURL}/brewery/locations?subcontinent=${subContinent.id}'>${subContinent.name}</a>"
                out << "</li>"
            }
            if( country ) {
                out << "<span class='divider'>/</span>"
                out << "<li>"
                out << "<a href='${baseURL}/brewery/locations?country=${country.id}'>${country.name}</a>"
                out << "</li>"
            }
            if( state ) {
                out << "<span class='divider'>/</span>"
                out << "<li>${state.name}</li>"
            }
            out << "</ul>"
        } else {
            out << "<div class='page-header'>"
            out << "<h1>All Countries</h1>"
            out << "</div>"
        }
    }
}
