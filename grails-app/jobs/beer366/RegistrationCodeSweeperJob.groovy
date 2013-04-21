package beer366

import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode

class RegistrationCodeSweeperJob {
    static triggers = {
        simple name: "registrationCodeSweeper", repeatInterval: 24 * 60 * 60 * 1000 // execute job once a day
    }

    def execute() {
        Date expiredDate = new Date().minus(7)
        def registrationCodes = RegistrationCode.findAllByDateCreatedLessThan(expiredDate)
        for( regCode in registrationCodes ) {
            regCode.delete(flush: true)
        }
    }
}
