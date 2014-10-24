package beer366

import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*


/**
 * MySQLService
 * A service class encapsulates the core business logic of a Grails application
 */
class BreweryDBService {

    static transactional = true
	static breweryDBURL = "http://api.brewerydb.com/v2/"
	static theKey = "d484ed3cecc6f6da1e4bab94b9b0d5de"

    Map get(String command,Map params) {
        Map result = null
		def http = new HTTPBuilder(breweryDBURL)
		def newParams = [key:theKey]
		if(params && !params.isEmpty()){
			newParams.putAll(params)
		}
		http.request(GET,JSON){
			uri.path = command
			uri.query = newParams
			
			response.success={resp,json->
				print uri.toString()
				println resp.statusLine
				result = json
			}
			
			response.failure={resp->
				println "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
			}
		}
		return result
    }
}
