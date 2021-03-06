package beer366

import org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib
/**
 * Beer
 * A domain class describes the data object and it's mapping to the database
 */
class Beer {
    static searchable = true

    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version

    /* Automatic timestamping of GORM */
    //	Date	dateCreated
    Date	lastUpdated
    String name
    Brewery brewery
    BeerSubStyle subStyle
    Float abv
    Integer baRating
    String baPage
    String notes
    //    Date updated

    String sanitizedName

    //	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        baPage sqlType: "text"
        name sqlType: "text"
        notes sqlType: "text"
        sort "name"
        abv sqlType: "decimal(4,2)"
        sanitizedName sqlType: "text"
    }

    static constraints = {
        abv scale: 2, min: 0.00f, max: 100.00f, nullable: true
        baRating nullable: true, range: 0..100
        baPage nullable: true, validator: { val, obj ->
            if( !obj.baPage ) {
                return true
            }
            obj.baPage = new Beer366Service().cleanBAPage( obj.baPage ) ?: null
            def beer = Beer.findByBaPage( obj.baPage )
            obj.baPage ==~ /\d+\/\d+/ && (beer?.id == obj.id || beer == null)
        }
        name blank: false
        notes nullable: true
        lastUpdated nullable: true
    }

    def beforeValidate() {
        if( !sanitizedName || (name && sanitizedName != name?.asFriendlyUrl()) ) {
            sanitizedName = name?.asFriendlyUrl()
        }
    }

    public String beerAdvocateURL() {
        baPage ? new Beer366Service().beerAdvocateBaseURL() + baPage : ""
    }

    public BigDecimal averageRating() {
        def drinkers = DrinkLog.findAllByBeerAndRatingIsNotNull( this )?.user?.unique()
        def rating = 0
        drinkers?.each {
            def userLogs = DrinkLog.findAllByUserAndBeerAndRatingIsNotNull( it, this )
            rating += userLogs?.rating?.sum() / (userLogs?.size() ?: 1)
        }
        new BigDecimal( rating / (drinkers?.size() ?: 1), new java.math.MathContext( 3 ) )
    }

    public String hasUserLogged( User user ) {
        def loggedBeers = DrinkLog.findAllByUser( user )?.beer
        loggedBeers?.contains( this ) ? "X" : loggedBeers?.contains( this ) ? "C" : ""
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}";
    }
}
