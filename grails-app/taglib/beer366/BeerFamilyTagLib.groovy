package beer366

import beer366.BeerFamily
import beer366.BeerStyle
import beer366.BeerSubStyle
import beer366.Beer

/**
 * BeerTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class BeerFamilyTagLib {
    static namespace = "b"

    def renderBeerFamily = { attrs ->
        def family = attrs.family
        out << "<h2>${family}</h2>"
        BeerStyle.findAllByFamily( family ).each { style ->
            out << "${g.link( action:"show", controller:"beerStyle", id:style.id, "${style}" )}<br>"
        }
    }

    def renderBeerStyle = { attrs ->
        def style = attrs.style
        out << renderBeerFamilyBreadCrumbs( object: style )
        out << "<h1>${style}</h1>"
        BeerSubStyle.findAllByStyle( style ).each { subStyle ->
            out << "${g.link( action:"show", controller:"beerSubStyle", id:subStyle.id, "${subStyle}" )}<br>"
        }
    }

    def renderBeerSubStyle = { attrs ->
        def subStyle = attrs.subStyle
        out << renderBeerFamilyBreadCrumbs( object: subStyle )
        out << renderBeers( beers: Beer.findAllBySubStyle( subStyle ) )
    }

    def renderBC = { attrs ->
        out << "<li>${g.link( action:"show", controller:attrs.controller, id:attrs.object.id, "${attrs.object}" )}</li>"
    }

    def renderBeerFamilyBreadCrumbs = { attrs ->
        def object = attrs.object
        out << "<ul class='breadcrumb'>"
        out << "<li>${g.link( action:"list", controller:"beerFamily", "All Styles" )}</li>"
        out << "<span class='divider'>/</span>"

        if( object instanceof BeerFamily ) {
            out << renderBC( controller:"beerFamily", object:object )
        } else if( object instanceof BeerStyle ) {
            out << renderBC( controller:"beerFamily", object:object.family )
            out << "<span class='divider'>/</span>"
            out << renderBC( controller:"beerStyle", object:object )
        } else if( object instanceof BeerSubStyle ) {
            out << renderBC( controller:"beerFamily", object:object.style.family )
            out << "<span class='divider'>/</span>"
            out << renderBC( controller:"beerStyle", object:object.style )
            out << "<span class='divider'>/</span>"
            out << renderBC( controller:"beerSubStyle", object:object )
        }

        out << "</ul>"
    }
}
