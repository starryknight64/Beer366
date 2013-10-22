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
                    ${beer.baPage ? "<i><a href='${beer.beerAdvocateURL()}' target='_blank'><i class='icon-share-alt'></i> ${beer.beerAdvocateURL()}</a></i><br>" : ""}
            """
            String breweryInfo = "${beer.brewery.fullName}"
            if( beer.brewery.city ) {
                breweryInfo += " - ${beer.brewery.city}"
                if( beer.brewery.region ?: beer.brewery.country ) {
                    breweryInfo += ", ${beer.brewery.region ?: beer.brewery.country}"
                }
            } else if( beer.brewery.region ?: beer.brewery.country ) {
                breweryInfo += " - ${beer.brewery.region ?: beer.brewery.country}"
            }
            out << """
                    <i>${breweryInfo}</i>
                </ul>
            """
        } else if( attrs.object instanceof Brewery ) {
            Brewery brewery = Brewery.get( attrs.object.id )
            out << """
                <b>${g.link( action:"show", controller:"brewery", id:brewery.id, "[${brewery.type}] ${brewery.fullName}" )}</b><br>
                <ul>
                    <i>${brewery.homepage ? "<a href='${brewery.homepage}' target='_blank'><i class='icon-home'></i> ${brewery.homepage}</a>" : ""}</i>${brewery.homepage ? "<br>" : ""}
            """
            String locationAndNotes = ""
            if( brewery.city ){
                locationAndNotes += "${brewery.city}"
                if( brewery.region ?: brewery.country ) {
                    locationAndNotes += ", ${brewery.region ?: brewery.country}"
                }
            } else if( brewery.region ?: brewery.country ) {
                locationAndNotes += "${brewery.region ?: brewery.country}"
            }
            if( locationAndNotes && brewery.notes ) {
                locationAndNotes += " - ${brewery.notes}"
            }
            out << """
                    <i class='ellipsis'>${locationAndNotes}</i>
                </ul>
            """
        }
    }
}
