package beer366

import org.codehaus.groovy.grails.plugins.web.taglib.ValidationTagLib
/**
 * Beer
 * A domain class describes the data object and it's mapping to the database
 */
class Beer {

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
    //    Date updated

    //	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        baPage sqlType: "text"
        name sqlType: "text"
        sort "name"
        abv sqlType: "decimal(4,2)"
    }

    static constraints = {
        abv scale: 2, min: 0.00f, nullable: true
        baRating nullable: true, range: 0..100
        baPage nullable: true, validator: { val, obj ->
            !obj.baPage || (obj.baPage ==~ /\d+\/\d+/ && Beer.findByBaPage( obj.baPage ) == null)
        }
        name blank: false
        lastUpdated nullable: true
    }

    def beforeValidate() {
        def g = new ValidationTagLib()
        def baURL = g.message( code: "beerAdvocate.baseURL" )
        def url = baPage?.toLowerCase()?.replace( baURL, "" )?.trim()
        baPage = url == "" ? null : url
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}";
    }
}
