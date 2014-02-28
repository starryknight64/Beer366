package beer366

import beer366.BeerFamily
import beer366.BeerStyle
import beer366.BeerSubStyle
import beer366.Beer

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

/**
 * BeerTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class DrinkLogTagLib {
	static namespace = "b"

	def springSecurityService

	def userCanDeleteDrinkLog = { attrs, body ->
		def drinkLog = attrs.drinkLog
		if (SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN") || springSecurityService.currentUser.id == drinkLog?.user?.id ) {
			out << body()
		}
	}
}
