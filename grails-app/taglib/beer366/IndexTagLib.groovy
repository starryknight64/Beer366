package beer366

/**
 * IndexTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class IndexTagLib {
    static namespace = "b"

    def springSecurityService
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
        beer366Service.userUniqueBeers( null )?.each { userID, uniqueBeerIDs ->
            def userUniqueBeerCount = uniqueBeerIDs.size()
            if( userUniqueBeerCount > 0 ) {
                def user = User.get( userID )
                def userDrinkLogCount = DrinkLog.countByUser( user )
                if( userDrinkLogCount > 0 ) {
                    def beersRemaining = 366 - (userUniqueBeerCount % 366)
                    out << """
                        <tr>
                          <td>
                            ${g.link( action:"show", controller:"user", id:user.id ) {avatar.gravatar(email: user.email)}} ${g.link( action:"show", controller:"user", id:user.id ) {user}}
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
                    ${b.formatABV( abv:beer.abv )}
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
        beer366Service.userGlobalUniqueBeersCount( null )?.each { userID, globalUniqueCount ->
            def userUniqueBeerCount = userToUniqueBeerMap.get( userID )?.size() ?: 0
            if( userUniqueBeerCount > 0 ) {
                def user = User.get(userID)
                out << """
                    <tr>
                      <td>
                        ${g.link( action:"show", controller:"user", id:user.id ) {avatar.gravatar(email: user.email)}} ${g.link( action:"show", controller:"user", id:userID ) {user}}
                      </td>
                      <td>
                        $userUniqueBeerCount
                      </td>
                      <td>
                        $globalUniqueCount
                      </td>
                      <td>
                        ${g.formatNumber( [number: globalUniqueCount / userUniqueBeerCount, format: "0.00%"] )}
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
        out << b.renderDrinkLogsSection( name: "Recent Activity", logs: drinkLogs, user: attrs?.user, showPerson: attrs?.user == null, showEditButton: (springSecurityService.currentUser == attrs.user) )
    }

    def renderDrinkLogsSection = { attrs ->
        def drinkLogs = attrs.logs ?: (attrs.user ? DrinkLog.findAllByUser( attrs.user ) : DrinkLog.findAllByDateGreaterThanEquals( new Date().minus(7) ))
        def isCurUserInRecentLog = drinkLogs.user?.contains(springSecurityService.currentUser)
        if( attrs.inCompleteLogPage ) {
            out << """
                <div class="page-header">
                    <h1>${attrs.name}</h1>
                </div>
                """
        } else {
            out << "<h1>${attrs.name}</h1>"
        }
        
        if( attrs.logs?.size() == 0 ) {
            if( attrs.inBeerPage ) {
                out << "<ul>No one has logged this beer yet.</ul>"
            } else {
                out << "<ul>None</ul>"
            }
            return
        }
        out << """
            <table class="table table-bordered table-hover sortable">
              <thead>
        """
        if( attrs?.showEditButton || isCurUserInRecentLog ) {
            out << "<th class='sorttable_nosort'></th>"
        }
        out << "<th>${g.message( [code:"allTotals.activity.date.label"] )}</th>"
        if( attrs?.showPerson ) {
            out << "<th>${g.message( [code:"allTotals.activity.person.label"] )}</th>"
        }
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

        drinkLogs.sort{ a,b -> b.date <=> a.date ?: b.id <=> a.id }.each { log ->
            out << "<tr>"
            if( attrs?.showEditButton || log.user == springSecurityService.currentUser ) {
                out << """
                    <td>
                        ${g.link( action:"edit", controller:"DrinkLog", id:log.id ) {"<i class='icon-pencil'></i>"}}
                    </td>
                """
            } else if( isCurUserInRecentLog ) {
                out << "<td></td>"
            }
            out << """
                    <td>
                        ${g.formatDate( [date:log.date, format:"MM/dd/yyyy"] )}
                    </td>
            """
            if( attrs?.showPerson ) {
                out << """
                        <td class="nowrap">
                            ${g.link( action:"show", controller:"user", id:log.user.id ) {avatar.gravatar(email: log.user.email)}} ${g.link( action:"show", controller:"user", id:log.user.id, class:"username" ) {log.user}}
                        </td>
                """
            }
            if( !attrs?.inBeerPage ) {
                out << """
                    <td class="nowrap">
                        ${g.link( action:"show", controller:"beer", id:log.beer.id ) {log.beer}}
                    </td>
                    <td>
                        ${g.link( action:"show", controller:"brewery", id:log.beer.brewery.id ) {log.beer.brewery}}
                    </td>
                """
            }
            out << """
                    <td class="nowrap" sorttable_customkey="${log.servingSize.ml}">
                        ${log.servingSize.name}
                    </td>
                    <td>
                        ${log.rating ?: ""}
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
