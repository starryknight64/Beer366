package beer366

/**
 * TotalsTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class UserTagLib {
    static namespace = "b"

    def springSecurityService
    def beer366Service

    def userHomeLink = { attrs, body ->
        def homepage = springSecurityService.currentUser.homepage ? "/$springSecurityService.currentUser.homepage" : "/"
        out << "<a class='brand' href='${createLink(uri: homepage)}'>${body()}</a>"
    }

    def renderFivesSection = { attrs ->
        def fives = DrinkLog.findAllByUserAndRatingGreaterThanEquals( attrs.user, 5 )?.beer?.unique().sort{ a, b -> a.name <=> b.name }
        out << "<h2>Fives</h2><ul>"
        if( fives ) {
            fives.each {
                out << "<li>${g.link( action:"show", controller:"beer", id:it.id, "${it}" )} [ ${g.link( action:"show", controller:"brewery", id:it.brewery.id, "${it.brewery}" )} ]</li>"
            }
        } else {
            out << "<li>None</li>"
        }
        out << "</ul>"
    }

    def renderUniqueBeersSection = { attrs ->
        def uniqueBeers = attrs.user?.getUniqueBeers()?.sort{ a,b -> a.brewery.name <=> b.brewery.name }
        out << "<h2>${attrs.user}'s Unique Beers</h2><ul>"
        if( uniqueBeers ) {
            uniqueBeers.each {
                out << "<li>${g.link( action:"show", controller:"brewery", id:it.brewery.id, "${it.brewery}" )}: ${g.link( action:"show", controller:"beer", id:it.id, "${it}" )}</li>"
            }
        } else {
            out << "<li>None</li>"
        }
        out << "</ul>"
    }

    def renderCellarSection = { attrs ->
        def total = 0
        def willTrade = 0
        Cellar.findAllByUser( attrs.user ).each {
            total += it.quantity ?: 0
            willTrade += it.willTrade ?: 0
        }
        out << "<h2>${attrs.user}'s Cellar</h2>"
        out << "<ul><li>${g.link( action:"list", controller:"cellar", id:"${attrs.user.id}", "${total} beers in the cellar - Will trade ${willTrade}." )}</li></ul>"
    }
}
