package beer366

import groovy.sql.Sql
import groovy.sql.GroovyRowResult

/**
 * MySQLService
 * A service class encapsulates the core business logic of a Grails application
 */
class SqlService {

    static transactional = true

    def dataSource

    Sql getSql() {
        new Sql( dataSource )
    }
}
