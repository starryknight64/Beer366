package beer366

/**
 * Brewery
 * A domain class describes the data object and it's mapping to the database
 */
class Brewery {

    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version

    /* Automatic timestamping of GORM */
    //	Date	dateCreated
    Date	lastUpdated
    String name
    String fullName
    String street
    String city
    String postalCode
    ISO_3166_1 country
    ISO_3166_2 region
    String homepage
    BreweryType type
    String notes
    //    Date updated

    //	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        name sqlType: "text"
        fullName sqlType: "text"
        street sqlType: "text"
        city sqlType: "text"
        postalCode sqlType: "text"
        homepage sqlType: "text"
        notes sqlType: "text"
        sort "name"
    }

    static constraints = {
        street nullable: true
        postalCode nullable: true
        region nullable: true
        homepage nullable: true, url: true
        notes nullable: true, widget: "textarea"
        name unique: true
        fullName unique: true
        lastUpdated nullable: true
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}";
    }
}
