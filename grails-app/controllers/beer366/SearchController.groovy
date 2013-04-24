package beer366

//import org.compass.core.engine.SearchEngineQueryParseException

/**
 * SearchController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class SearchController {
    def searchableService

    static scaffold = true

    def index = {
        if (!params.q?.trim()) {
            redirect(controller: "home", action: "index")
        } else {
            try {
                return [searchResult: searchableService.search(params.q, params)]
            } catch (Exception ex) {
//                redirect(controller: "home", action: "index")
                return [parseException: true]
            }
        }
    }
}
