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

    public String cleanBAPage( String baPage ) {
        String url = baPage?.trim()?.toLowerCase()
        def matcher = url =~ /.*?(\d+\/\d+).*/
        if( matcher.matches() ) {
            url = matcher.group(1)
        }
        return url
    }

    def beerAdvocateBaseURL() {
        "http://beeradvocate.com/beer/profile/"
    }

    def userUniqueBeers( Long usrID ) {
        def userID = usrID ?: 0
        def sql = sqlService.getSql()//new Sql(sessionFactory.currentSession.connection())
        def rows = sql.rows( """\
            SELECT dl.user_id, dl.beer_id FROM drink_log AS dl
            INNER JOIN user AS u ON u.id = dl.user_id
            ${ userID > 0 ? "" : "WHERE u.last_login >= ( NOW() - INTERVAL 30 DAY )" }
            ${ userID > 0 ? " AND user_id=?" : ""}
            GROUP BY user_id, beer_id""", userID > 0 ? [userID] : [] )
        def userToBeerMap = [:]
        rows.each{ row ->
            userToBeerMap.get( row.user_id, new HashSet<Integer>() ).add( row.beer_id )
        }
        sql.close()
        return userToBeerMap.isEmpty() ? [(userID) : new HashSet<Integer>()] : userToBeerMap
    }
    
    def userGlobalUniqueBeers( Long usrID ) {
        def userID = usrID ?: 0
        def sql = sqlService.getSql()//new Sql(sessionFactory.currentSession.connection())
        def rows = sql.rows( """\
            SELECT dl.user_id, dl.beer_id FROM drink_log AS dl
            LEFT JOIN drink_log AS dl2 ON dl.beer_id = dl2.beer_id AND dl.user_id != dl2.user_id
            INNER JOIN user AS u ON u.id = dl.user_id
            WHERE dl2.user_id IS NULL
            ${ userID > 0 ? "" : " AND u.last_login >= ( NOW() - INTERVAL 30 DAY )" }
            ${ userID > 0 ? " AND dl.user_id = ?" : "" }
            GROUP BY dl.user_id, dl.beer_id""", userID > 0 ? [ userID ] : [] )
        def userToBeerMap = [:]
        rows.each{ row ->
            userToBeerMap.get( row.user_id, new HashSet<Integer>() ).add( row.beer_id )
        }
        sql.close()
        return userToBeerMap.isEmpty() ? [(userID) : new HashSet<Integer>()] : userToBeerMap
    }
    
    def userGlobalUniqueBeersCount( Long usrID ) {
        def userID = usrID ?: 0
        def sql = sqlService.getSql()//new Sql(sessionFactory.currentSession.connection())
        def rows = sql.rows( """\
            SELECT u.username, u.id, COUNT( t.user_id ) AS uniques
            FROM ( 
                SELECT dl.user_id,dl.beer_id FROM drink_log AS dl
                LEFT JOIN drink_log AS dl2 ON ( dl.beer_id = dl2.beer_id AND dl.user_id != dl2.user_id )
                WHERE dl2.user_id IS NULL
                ${ userID > 0 ? " AND dl.user_id = ?" : "" }
                GROUP BY dl.user_id, dl.beer_id
            ) AS t
            INNER JOIN user AS u ON ( u.id = t.user_id )
            ${ userID > 0 ? "" : "WHERE u.last_login >= ( NOW() - INTERVAL 30 DAY )" }
            GROUP BY t.user_id
            ORDER BY uniques DESC""", userID > 0 ? [ userID ] : [] )
        def userToBeerMap = [:]
        rows.each{ row ->
            userToBeerMap.put( row.id, row.uniques )
        }
        sql.close()
        return userToBeerMap.isEmpty() ? [(userID) : new HashSet<Integer>()] : userToBeerMap
    }
	
	def beerStyles( Long stylID ) {
		def styleID = stylID ?: 0
		def sql = sqlService.getSql()
		def rows = sql.rows( """\
            SELECT bs.id AS styleID, bs.name AS styleName, bss.id AS subStyleID, bss.name AS subStyleName FROM beer_style AS bs
			LEFT JOIN beer_sub_style AS bss ON bss.style_id = bs.id
			${styleID > 0 ? "WHERE bs.id = ?" : ""}
			ORDER BY bs.name ASC, bss.name ASC""", styleID > 0 ? [ styleID ] : [] )
		def styles = []
		rows.each { row ->
			def style = styles.find{ it.id == row.styleID } ?: [:]
			styles.remove(style)
			style.put( "id", row.styleID )
			style.put( "name", row.styleName )
			style.get( "subStyles", [] ).add( ["id":row.subStyleID,"name":row.subStyleName] )
			styles.add(style)
		}
		return styles
	}
}
