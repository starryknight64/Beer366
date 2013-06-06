package beer366

/**
 * BeerTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class BeerTagLib {
    static namespace = "b"

    def formatABV = { attrs ->
        def abv = attrs.abv
        out << (abv ? "${g.formatNumber( [number:abv, format:'0.00'] )}%" : "")
    }
}
