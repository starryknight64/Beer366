package beer366

/**
 * SearchTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class SearchTagLib {
    static namespace = "b"

    def renderSearchResultRow = { attrs ->
        if( attrs.object instanceof User ) {
            User user = attrs.object
            out << """
                <b>${g.link( action:"show", controller:"user", id:user.id, "[User] ${user}" )}</b><br>
                <ul>
                    <i>${user.firstName} ${user.lastName}</i>
                </ul>
            """
        } else if( attrs.object instanceof Beer ) {
            Beer beer = Beer.get( attrs.object.id )
            out << """
                <b>${g.link( action:"show", controller:"beer", id:beer.id, "[${beer.subStyle}] ${beer}" )}</b><br>
                <ul>
                    <i>${beer.baPage ? "<a href='${beer.beerAdvocateURL()}'>${beer.beerAdvocateURL()}</a>" : ""}</i>${beer.baPage ? "<br>" : ""}
                    <i>${beer.brewery}</i>
                </ul>
            """
        } else if( attrs.object instanceof Brewery ) {
            Brewery brewery = Brewery.get( attrs.object.id )
            out << """
                <b>${g.link( action:"show", controller:"brewery", id:brewery.id, "[${brewery.type}] ${brewery}" )}</b><br>
                <ul>
                    <i>${brewery.homepage ? "<a href='${brewery.homepage}'>${brewery.homepage}</a>" : ""}</i>${brewery.homepage ? "<br>" : ""}
                    <i>${brewery.notes ?: ""}</i>
                </ul>
            """
        }
    }
}
