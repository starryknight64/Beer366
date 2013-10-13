class UrlMappings {

    static mappings = {

        /*
         * Pages without controller
         */
        //		"/"				(view:"/index")
		"/about"		(view:"/siteinfo/about")
		"/blog"			(view:"/siteinfo/blog")
		"/systeminfo"	(view:"/siteinfo/systeminfo")
		"/contact"		(view:"/siteinfo/contact")
		"/terms"		(view:"/siteinfo/terms")
		"/imprint"		(view:"/siteinfo/imprint")

        /*
         * SEO-Friendly URLs
         */
        "/beer/$sanitizedName?" {
            controller='beer'
            constraints {
                sanitizedName(matches:/^(?!^list$).+$/)
            }
        }
        "/brewery/$sanitizedName?" {
            controller='brewery'
            constraints {
                sanitizedName(matches:/^(?!^list$).+$/)
            }
        }
        "/user/$sanitizedUsername?" {
            controller='user'
            constraints {
                sanitizedUsername(matches:/^(?!^list$).+$/)
            }
        }
        //        "/beer/$sanitizedName?"{
        //            controller='beer'
        //            action='show'
        ////            constraints {
        ////                sanitizedName(matches:/^(?!^list$).+$/)
        ////            }
        //        }
        //        "/brewery/$sanitizedName?"{
        //            controller='brewery'
        //            action='show'
        //            constraints {
        //                sanitizedName(matches:/^((?!(list|locations)).*)$/)
        //                //                sanitizedName(matches:/^(?!^(list|locations)$).+$/)
        //            }
        //        }
        //        "/brewery/locations?country=$sanitizedCountry"{
        //            controller:'brewery'
        //            action:'list'
        //            constraints {
        //                sanitizedName(matches:/^(?!^list$).+$/)
        //            }
        //        }
        //        "/brewery/locations?state=$sanitizedState"{
        //            controller:'brewery'
        //            action:'show'
        //            constraints {
        //                sanitizedName(matches:/^(?!^list$).+$/)
        //            }
        //        }
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
                controller(matches:/^((?!(api|mobile|web)).*)$/)
            }
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
