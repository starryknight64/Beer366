package rest

import java.text.SimpleDateFormat

import beer366.Brewery
import beer366.Beer
import beer366.DrinkLog
import beer366.ServingSize
import beer366.User

import grails.converters.JSON

class RestDrinkLogController {

	static allowedMethods = [create: "POST", update: "POST", delete: "POST", index: "GET", list: "GET"]

	def springSecurityService
	def beer366RestService

	def list() {
		render DrinkLog.findAllByUser(params.userid ? User.get(params.userid) : springSecurityService.currentUser) as JSON
	}

	def index() {
		def drinkLog = DrinkLog.get(params.id)
		if( !drinkLog ) {
			drinkLog = [:]
		}
		render drinkLog as JSON
	}

	def create() {
		def drinkLogParams = [:]

		def date = beer366RestService.getDateFromString( request.JSON.date )
		if( !date ) {
			def errorMessage = ["errors": [["object":"date","message":"Date is formatted incorrectly!"]]]
			render errorMessage as JSON
			return
		}
		drinkLogParams.put("date", date)

		def user = User.read(request.JSON.userID ?: request.JSON.user?.id)
		if( user && user.id != springSecurityService.currentUser.id ) {
			def errorMessage = ["errors": [["object":"user","message":"You cannot log drinks on behalf of someone else!"]]]
			render errorMessage as JSON
			return
		}
		drinkLogParams.put("user", user)

		drinkLogParams.put("beer", Beer.read(request.JSON.beerID ?: request.JSON.beer?.id ))
		drinkLogParams.put("servingSize", ServingSize.get( request.JSON.servingSizeID ?: request.JSON.servingSize?.id ))
		drinkLogParams.put("rating", request.JSON.rating ?: null)
		drinkLogParams.put("notes", request.JSON.notes ?: null)

		def drinkLog = new DrinkLog(drinkLogParams)
		if (!drinkLog.save()) {
			render drinkLog.errors as JSON
			return
		}

		render drinkLog as JSON
	}
}
