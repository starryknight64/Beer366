package beer366

/**
 * IndexTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class IndexTagLib {
    static namespace = "b"

    def beer366Service

    def renderDrinkerSummarySection = {
        out << """
            <h2>Drinker Summary</h2>
              <table class="table table-bordered table-hover sortable">
                <thead>
                  <th>${g.message( [code:"allTotals.summary.drinker.label"] )}</th>
                  <th>${g.message( [code:"allTotals.summary.totalBeers.label"] )}</th>
                  <th>${g.message( [code:"allTotals.summary.uniqueBeers.label"] )}</th>
                  <th>${g.message( [code:"allTotals.summary.remaining.label"] )}</th>
                  <th>${g.message( [code:"allTotals.summary.percent.label"] )}</th>
                  <th>${g.message( [code:"allTotals.summary.finishDate.label"] )}</th>
                </thead>"""
        User.list().each{ user ->
            def userDrinkLogCount = DrinkLog.countByUser( user )
            if( userDrinkLogCount > 0 ) {
                def userUniqueBeerCount = beer366Service.userUniqueBeers( user ).get( user.id ).size()
                def beersRemaining = 366 - (userUniqueBeerCount % 366)
                if( userUniqueBeerCount > 0 ) {
                    out << """
                        <tr>
                          <td>
                            ${g.link( action:"show", controller:"user", id:user.id ) {user}}
                          </td>
                          <td>
                            $userDrinkLogCount
                          </td>
                          <td>
                            $userUniqueBeerCount
                          </td>
                          <td>
                            $beersRemaining
                          </td>
                          <td>
                            ${g.formatNumber( [number:(userUniqueBeerCount % 366) / 366, format:"0.00%"] )}
                          </td>
                          <td>
                            ${g.formatDate( [date:new Date().plus(beersRemaining), format:"MM/dd/yyyy"] )}
                          </td>
                        </tr>"""
                }
            }
        }
        out << "</table>"
    }

    def renderStrongestBeersSection = { attrs ->
        out << """
            <h2>Strongest Beers</h2>
            <table class="table table-bordered table-hover sortable">
              <thead>
                <th>${g.message( [code:"allTotals.strongestBeers.beer.label"] )}</th>
                <th>${g.message( [code:"allTotals.strongestBeers.brewery.label"] )}</th>
                <th>${g.message( [code:"allTotals.strongestBeers.abv.label"] )}</th>
              </thead>"""
        def beers
        if( attrs.user ) {
            beers = DrinkLog.findAllByUser( attrs.user )?.beer?.unique()?.sort{ a, b -> b.abv <=> a.abv }?.take(20)
        } else {
            beers = Beer.listOrderByAbv( max: 20, order: "desc" )
        }
        beers?.each { beer ->
            out << """
                <tr>
                  <td>
                    ${g.link( action:"show", controller:"beer", id:beer.id ) {beer}}
                  </td>
                  <td>
                    ${g.link( action:"show", controller:"brewery", id:beer.brewery.id ) {beer.brewery}}
                  </td>
                  <td>
                    ${g.formatNumber( [number:beer.abv, format:"0.00"] )}%
                  </td>
                </tr>"""
        }
        out << "</table>"
    }

    def renderStatisticsSection = {
        out << """
            <h2>Unique Beer Statistics</h2>
            <p>A Globally Unique beer is one that only one user has had.</p>
            <table class="table table-bordered table-hover sortable">
              <thead>
                <th>${g.message( [code:"allTotals.statistics.person.label"] )}</th>
                <th>${g.message( [code:"allTotals.statistics.uniques.label"] )}</th>
                <th>${g.message( [code:"allTotals.statistics.globalUniques.label"] )}</th>
                <th>${g.message( [code:"allTotals.statistics.percent.label"] )}</th>
              </thead>"""

        def userToUniqueBeerMap = beer366Service.userUniqueBeers( null )
        def userToGlobalUniqueBeerMap = beer366Service.userGlobalUniqueBeers( null )
        User.list().each{ user ->
            def userUniqueBeerCount = userToUniqueBeerMap.get( user.id )?.size() ?: 0
            if( userUniqueBeerCount > 0 ) {
                def userGlobalUniqueBeerCount = userToGlobalUniqueBeerMap.get( user.id )?.size() ?: 0
                out << """
                    <tr>
                      <td>
                        ${g.link( action:"show", controller:"user", id:user.id ) {user}}
                      </td>
                      <td>
                        $userUniqueBeerCount
                      </td>
                      <td>
                        $userGlobalUniqueBeerCount
                      </td>
                      <td>
                        ${g.formatNumber( [number: userGlobalUniqueBeerCount / userUniqueBeerCount, format: "0.00%"] )}
                      </td>
                    </tr>"""
            }
        }
        out << "</table>"
    }

    def renderRecentActivitySection = { attrs ->
        def drinkLogs
        if( attrs?.user ) {
            drinkLogs = DrinkLog.findAllByUserAndDateGreaterThanEquals( attrs.user, new Date().minus(7) )
        } else {
            drinkLogs = DrinkLog.findAllByDateGreaterThanEquals( new Date().minus(7) )
        }
        out << b.renderDrinkLogsSection( name: "Recent Activity", logs: drinkLogs, user: attrs?.user )
    }

    def renderDrinkLogsSection = { attrs ->
        out << """
            <h1>${attrs.name}</h1>
        """
        if( attrs.logs?.size() == 0 ) {
            if( attrs?.inBeerPage ) {
                out << "<ul>No one has logged this beer yet.</ul>"
            } else {
                out << "<ul>None</ul>"
            }
            return
        }
        out << """
            <table class="table table-bordered table-hover sortable">
              <thead>
                <th>${g.message( [code:"allTotals.activity.date.label"] )}</th>
                <th>${g.message( [code:"allTotals.activity.person.label"] )}</th>
        """
        if( !attrs?.inBeerPage ) {
            out << """
                <th>${g.message( [code:"allTotals.activity.beer.label"] )}</th>
                <th>${g.message( [code:"allTotals.activity.brewery.label"] )}</th>
            """
        }
        out << """
                <th>${g.message( [code:"allTotals.activity.serving.label"] )}</th>
                <th>${g.message( [code:"allTotals.activity.rating.label"] )}</th>
                <th>${g.message( [code:"allTotals.activity.notes.label"] )}</th>
              </thead>
        """
        def drinkLogs = attrs.logs == null ? (attrs.user ? DrinkLog.findAllByUser( attrs.user ) : DrinkLog.findAllByDateGreaterThanEquals( new Date().minus(7) )) : attrs.logs
        drinkLogs.sort{ a,b -> b.date <=> a.date ?: b.id <=> a.id }.each { log ->
            out << """
                <tr>
                    <td>
                        ${g.formatDate( [date:log.date, format:"MM/dd/yyyy"] )}
                    </td>
                    <td>
                        ${g.link( action:"show", controller:"user", id:log.user.id ) {log.user}}
                    </td>
            """
            if( !attrs?.inBeerPage ) {
                out << """
                    <td>
                        ${g.link( action:"show", controller:"beer", id:log.beer.id ) {log.beer}}
                    </td>
                    <td>
                        ${g.link( action:"show", controller:"brewery", id:log.beer.brewery.id ) {log.beer.brewery}}
                    </td>
                """
            }
            out << """
                    <td>
                        ${log.size}
                    </td>
                    <td>
                        ${log.rating}
                    </td>
                    <td>
                        ${log.notes ?: ""}
                    </td>
                </tr>
            """
        }
        out << "</table>"
    }
}