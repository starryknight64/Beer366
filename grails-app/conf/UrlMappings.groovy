class UrlMappings {

    static mappings = {

        /*
         * Pages without controller
         */
        //		"/"				(view:"/index")
		"/about"		(view:"/siteinfo/about")
//		"/blog"			(view:"/siteinfo/blog")
//		"/systeminfo"	(view:"/siteinfo/systeminfo")
//		"/contact"		(view:"/siteinfo/contact")
//		"/terms"		(view:"/siteinfo/terms")
//		"/imprint"		(view:"/siteinfo/imprint")

        /*
         * SEO-Friendly URLs
         */
        /*"/beer/$sanitizedName?" {
            controller='beer'
            constraints {
                sanitizedName(matches:/^(?!^(list|create|save|show|edit|update|delete|breweryBeers)$).+$/)
            }
        }
        "/brewery/$sanitizedName?" {
            controller='brewery'
            constraints {
                sanitizedName(matches:/^(?!^(list|create|save|show|edit|update|delete|locations|locationCount)$).+$/)
            }
        }
        "/user/$sanitizedUsername?" {
            controller='user'
            constraints {
                sanitizedUsername(matches:/^(?!^(list|create|save|show|edit|update|delete|updateHomepage|totals|uniques|completelog|info)$).+$/)
            }
        }*/
        //        "/cellar/$sanitizedUsername"{
        //            controller:'beer'
        //            action:'show'
        //            constraints {
        //                sanitizedName(matches:/^(?!^list$).+$/)
        //            }
        //        }
        /*
         * Pages with controller
         * WARN: No domain/controller should be named "api" or "mobile" or "web"!
         */
        "/"	{
            controller	= 'home'
            action		= { 'index' }
            view		= { 'index' }
        }
		"/$controller/$action?/$id?"{
            constraints {
                controller(matches:/^((?!(rest|api|mobile|web)).*)$/)
            }
        }
		"/rest/brewery/$action?" {
			controller = "RestBrewery"
		}
		"/rest/brewery/$id?" {
			controller = "RestBrewery"
		}
		"/rest/beer/$action?/$id?" {
			controller = "RestBeer"
		}
		"/rest/beer/$action?" {
			controller = "RestBeer"
		}
		"/rest/beer/$id?" {
			controller = "RestBeer"
		}
		"/rest/servingsize/$action?" {
			controller = "RestServingSize"
		}
		"/rest/servingsize/$id?" {
			controller = "RestServingSize"
		}
		"/rest/drinklog/$action?" {
			controller = "RestDrinkLog"
			constraints {
				action(matches:/^(list|create|update|delete).*$/)
			}
		}
		"/rest/drinklog/$id?" {
			controller = "RestDrinkLog"
		}
        /*
         * System Pages without controller
         */
		"403"	(view:'/_errors/403')
		"404"	(view:'/_errors/404')
		"500"	(view:'/_errors/error')
		"503"	(view:'/_errors/503')
    }
}
