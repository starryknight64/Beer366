package beer366

/**
 * BeerTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class BeerTagLib {
    static namespace = "b"

    def formatABV = { attrs ->
        def abv = attrs.abv
        out << (abv ? "${g.formatNumber( number:abv, format:'0.00' )}%" : "")
    }

    def renderBeers = { attrs ->
        def beers = attrs.beers
        out << """
            <h2>Beers</h2>
            <table class="table table-bordered sortable">
                <thead>
                    <tr>
                        <th>${g.message( code:'brewery.beer.name.label' )}</th>
        """
        if( attrs.showBreweries ) {
            out << "<th>${g.message( code:'beer.brewery.label' )}</th>"
        }
        if( attrs.showStyles ) {
            out << "<th>${g.message( code:'brewery.beer.style.label' )}</th>"
        }
        out << """
                        <th>${g.message( code:'brewery.beer.abv.label' )}</th>
                        <th>${g.message( code:'brewery.beer.baRating.label' )}</th>
                        <th>${g.message( code:'brewery.beer.ivehad.label' )}</th>
                    </tr>
                </thead>
        """
        def currentUser = User.get( sec.loggedInUserInfo(field:'id').toInteger() )
        out << "<tbody>"
        beers.each{ beer ->
            out << "<tr>"
            out << "<td>${g.link( action:"show", controller:"beer", id:beer.id, "${beer}" )}</td>"
            if( attrs.showBreweries ) {
                out << "<td>${g.link( action:"show", controller:"Brewery", id:beer.brewery.id, "${beer.brewery}" )}</td>"
            }
            if( attrs.showStyles ) {
                out << "<td>${g.link( action:"show", controller:"BeerSubStyle", id:beer.subStyle.id, "${beer.subStyle}" )}</td>"
            }
            out << "<td>${b.formatABV( abv:beer.abv )}</td>"
            out << "<td>${beer.baRating ? "<a href='${beer.beerAdvocateURL()}' target='_blank'>${beer.baRating}<i class='icon-share-alt'></i></a>" : "-"}</td>"
            out << "<td>${beer.hasUserLogged(currentUser)}</td>"
            out << "</tr>"
        }
        out << "</tbody>"
        out << "</table>"
    }
}
