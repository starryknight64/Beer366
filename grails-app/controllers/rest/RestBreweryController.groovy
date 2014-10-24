package rest

import beer366.Brewery
import grails.converters.JSON

class RestBreweryController {

	def list() {
		render Brewery.list() as JSON
	}
	
	def index() {
		def brewery = Brewery.read(params.id)
		if( !brewery ) {
			brewery = [:]
		}
		render brewery as JSON
	}
}
