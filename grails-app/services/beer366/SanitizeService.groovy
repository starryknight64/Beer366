package beer366

import groovy.time.*

/**
 * SanitizeService
 * A service class encapsulates the core business logic of a Grails application
 */
class SanitizeService {

    static transactional = true

    def sanitizeAll() {
		def startTime = new Date()
        System.out.println("Sanitizing usernames...")
        def users = User.list()
        users.eachWithIndex{ user, i ->
            if( user.sanitizedUsername != user.username.asFriendlyUrl() ) {
                user.sanitizedUsername = user.username.asFriendlyUrl()
                if (!user.save(flush:true)) {
                    user.errors.each {
                        println it
                    }
                }
            }
            if( i % 10 == 0 ) {
                System.out.println( "$i/${users.size()} (${(i * 100 / users.size()).floatValue().round(1)}% done)" )
            }
        }
        System.out.println("done in ${TimeCategory.minus(new Date(), startTime)}!")

		startTime = new Date()
        System.out.println("Sanitizing brewery names...")
        def breweries = Brewery.list()
        breweries.eachWithIndex{ brewery, i ->
            if( brewery.sanitizedName != brewery.name.asFriendlyUrl() ) {
                brewery.sanitizedName = brewery.name.asFriendlyUrl()
                if (!brewery.save(flush:true)) {
                    brewery.errors.each {
                        println it
                    }
                }
            }
            if( i % 100 == 0 ) {
                System.out.println( "$i/${breweries.size()} (${(i * 100 / breweries.size()).floatValue().round(1)}% done)" )
            }
        }
        System.out.println("done in ${TimeCategory.minus(new Date(), startTime)}!")

		startTime = new Date()
        System.out.println("Sanitizing beer names...")
        def beers = Beer.list()
        beers.eachWithIndex{ beer, i ->
            if( beer.sanitizedName != beer.name.asFriendlyUrl() ) {
                beer.sanitizedName = beer.name.asFriendlyUrl()
                if (!beer.save(flush:true)) {
                    beer.errors.each {
                        println it
                    }
                }
            }
            if( i % 100 == 0 ) {
                System.out.println( "$i/${beers.size()} (${(i * 100 / beers.size()).floatValue().round(1)}% done)" )
            }
        }
        System.out.println("done in ${TimeCategory.minus(new Date(), startTime)}!")
    }
}
