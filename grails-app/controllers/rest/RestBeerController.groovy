package rest

import beer366.Brewery
import beer366.Beer

import grails.converters.JSON

class RestBeerController {
	
	def index() {
		def beer = Beer.read(params.id)
		if( !beer ) {
			beer = [:]
		}
		render beer as JSON
	}
	
	def brewery() {
		def brewery = Brewery.read(params.id)
		def beers = []
		if( brewery ) {
			beers = Beer.findAllByBrewery(brewery)
		}
		render beers as JSON
	}
}
