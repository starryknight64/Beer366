// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           "*/*",
    atom:          "application/atom+xml",
    css:           "text/css",
    csv:           "text/csv",
    form:          "application/x-www-form-urlencoded",
    html:          ["text/html","application/xhtml+xml"],
    js:            "text/javascript",
    json:          ["application/json", "text/json"],
    multipartForm: "multipart/form-data",
    rss:           "application/rss+xml",
    text:          "text/plain",
    xml:           ["text/xml", "application/xml"]
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ["/images/*", "/css/*", "/js/*", "/plugins/*"]

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = "Instance"

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ["password"]

// configure auto-caching of queries by default (if false you can cache individual queries with "cache: true")
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:"stdout", layout:pattern(conversionPattern: "%c{2} %m%n")
    //}

    error  "org.codehaus.groovy.grails.web.servlet",        // controllers
           "org.codehaus.groovy.grails.web.pages",          // GSP
           "org.codehaus.groovy.grails.web.sitemesh",       // layouts
           "org.codehaus.groovy.grails.web.mapping.filter", // URL mapping
           "org.codehaus.groovy.grails.web.mapping",        // URL mapping
           "org.codehaus.groovy.grails.commons",            // core / classloading
           "org.codehaus.groovy.grails.plugins",            // plugins
           "org.codehaus.groovy.grails.orm.hibernate",      // hibernate integration
           "org.springframework",
           "org.hibernate",
           "net.sf.ehcache.hibernate"
}

grails.config.defaults.locations = [KickstartResources]
kickstart.metrics.calculate = false
kickstart.build.calculate = false

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = "beer366.User"
grails.plugins.springsecurity.userLookup.authorityJoinClassName = "beer366.UserRole"
grails.plugins.springsecurity.authority.className = "beer366.Role"

grails.plugins.springsecurity.dao.reflectionSaltSourceProperty = 'salt'
grails.plugins.springsecurity.password.encodeHashAsBase64 = true

grails.plugins.springsecurity.ui.forgotPassword.emailFrom = "pdponzer@gmail.com"
grails.plugins.springsecurity.ui.password.minLength = 3
grails.plugins.springsecurity.ui.password.validationRegex = "(?i)[a-z0-9_]+"

grails.plugins.springsecurity.securityConfigType = "InterceptUrlMap"
grails.plugins.springsecurity.interceptUrlMap = [
   "/js/**":        ["permitAll"],
   "/css/**":       ["permitAll"],
   "/images/**":    ["permitAll"],
   "/login/**":     ["permitAll"],
   "/register/**":     ["permitAll"],
   "/logout/**":    ["!isAnonymous()"],
   "/**":           ["!isAnonymous()"],
   "/beer/**":    ["!isAnonymous()"],
   "/beerfamily/**":    ["!isAnonymous()"],
   "/beerstyle/**":    ["!isAnonymous()"],
   "/beersubstyle/**":    ["!isAnonymous()"],
   "/brewery/**":    ["!isAnonymous()"],
   "/brewerytype/**":    ["hasRole('ROLE_ADMIN')"],
   "/cellar/**":    ["!isAnonymous()"],
   "/continent/**":    ["hasRole('ROLE_ADMIN')"],
   "/drinklog/**":    ["!isAnonymous()"],
   "/iso_3166_1/**":    ["hasRole('ROLE_ADMIN')"],
   "/iso_3166_2/**":    ["hasRole('ROLE_ADMIN')"],
   "/role/**":    ["hasRole('ROLE_ADMIN')"],
   "/servingsize/**":    ["!isAnonymous()"],
   "/subcontinent/**":    ["hasRole('ROLE_ADMIN')"],
   "/user/**":    ["hasRole('ROLE_ADMIN')"],
   "/userrole/**":    ["hasRole('ROLE_ADMIN')"]
]

grails {
   mail {
     host = "localhost"
     port = 25
     username = "beer366@localhost.com"
     password = "beer366"
     props = ["mail.smtp.auth":"true"]
   }
}
