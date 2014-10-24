package rest

import java.text.SimpleDateFormat

/**
 * Beer366RestService
 * A service class encapsulates the core business logic of a Grails application
 */
class Beer366RestService {

	static transactional = true

	Date getDateFromString(String dateStr) {
		Date date = null
		def formats = [
			(~/\d{2}-\d{2}-\d{4}/) : new SimpleDateFormat("MM-dd-yyyy"),
			(~/\d{4}-\d{2}-\d{2}/) : new SimpleDateFormat("yyyy-MM-dd")
		]
		for( def format : formats ) {
			try {
				if( format.key.matcher( dateStr ).find() ) {
					date = format.value.parse( dateStr )
					break
				}
			} catch(ex) {
			}
		}
		return date
	}
	
	String getStringFromDate(Date date) {
		return new SimpleDateFormat("MM-dd-yyyy").format(date)
	}
}
