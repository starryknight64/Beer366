package beer366

import groovy.sql.Sql
/**
 * Beer366Service
 * A service class encapsulates the core business logic of a Grails application
 */
class Beer366Service {

    static transactional = true
//    def sessionFactory
    def sqlService

    def beerAdvocateBaseURL() {
        "http://beeradvocate.com/beer/profile/"
    }

    def userUniqueBeers( User user ) {
        def userID = user?.id ?: 0
        def sql = sqlService.getSql()//new Sql(sessionFactory.currentSession.connection())
        def rows = sql.rows( """\
            SELECT dl.user_id, dl.beer_id
            FROM drink_log AS dl
            INNER JOIN serving_size AS ss ON ss.id = dl.size_id
            WHERE ss.ml >= 237
            ${ userID > 0 ? " AND user_id=?" : ""}
            GROUP BY user_id, beer_id""", userID > 0 ? [userID] : [] )
        def userToBeerMap = [:]
        rows.each{ row ->
            userToBeerMap.get( row.user_id, new HashSet<Integer>() ).add( row.beer_id )
        }
        sql.close()
        return userToBeerMap.isEmpty() ? [(userID) : new HashSet<Integer>()] : userToBeerMap
    }

    def userGlobalUniqueBeers( User user ) {
        def userID = user?.id ?: 0
        def sql = sqlService.getSql()//new Sql(sessionFactory.currentSession.connection())
        def rows = sql.rows( """\
            SELECT dl.user_id, dl.beer_id FROM drink_log AS dl
            LEFT JOIN drink_log AS dl2 ON dl.beer_id = dl2.beer_id AND dl.user_id != dl2.user_id
            INNER JOIN serving_size AS ss ON ss.id = dl.size_id
            WHERE dl2.user_id IS NULL AND ss.ml >= 237
            ${ userID > 0 ? " AND dl.user_id = ?" : "" }
            GROUP BY dl.user_id, dl.beer_id""", userID > 0 ? [ userID ] : [] )
        def userToBeerMap = [:]
        rows.each{ row ->
            userToBeerMap.get( row.user_id, new HashSet<Integer>() ).add( row.beer_id )
        }
        sql.close()
        return userToBeerMap.isEmpty() ? [(userID) : new HashSet<Integer>()] : userToBeerMap
    }
}
