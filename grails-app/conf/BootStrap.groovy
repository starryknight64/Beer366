import beer366.Role
import beer366.User
import beer366.UserRole
import groovy.sql.Sql

class BootStrap {

    transient springSecurityService
    def sessionFactory
    def sanitizeService

    def init = { servletContext ->
        if( User.list().size() > 0 ) {
            def adminRole = Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority: "ROLE_ADMIN").save(flush: true)
            def adminUser = User.findByUsername( "admin" ) ?: new User(username: "admin", email: "admin@beer366.com", enabled: true, password: "password").save(flush: true)
            def testUser = User.findByUsername( "user" ) ?: new User(username: "user", email: "user@beer366.com", enabled: true, password: "password").save(flush: true)
            new UserRole(user: adminUser, role: adminRole).save( flush: true )
        }
        sanitizeService.sanitizeAll()
    }

    def destroy = {
    }
}
