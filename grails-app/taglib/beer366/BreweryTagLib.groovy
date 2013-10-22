package beer366

/**
 * BreweryTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class BreweryTagLib {
    static namespace = "b"

    def renderBreweryABC = { attrs ->
        def hasID = (attrs.id != null)
        for( character in "#abcdefghijklmnopqrstuvwxyz" ) {
            if( hasID && attrs.id == character ) {
                out << "<li class='active'>"
            } else if( !hasID && character == "#" ) {
                out << "<li class='active'>"
            } else {
                out << "<li>"
            }
            out << "<a href='${createLink(action: 'list', id: character)}'>${character.toUpperCase()}</a></li>"
        }
    }
}
