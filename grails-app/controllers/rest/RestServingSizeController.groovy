package rest

import beer366.ServingSize

import grails.converters.JSON

class RestServingSizeController {

	def list() {
		render ServingSize.list() as JSON
	}

	def index() {
		def servingSize = ServingSize.read(params.id)
		if( !servingSize ) {
			servingSize = [:]
		}
		render servingSize as JSON
	}
}
