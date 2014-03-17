package beer366

/**
 * ISO_3166_1
 * A domain class describes the data object and it's mapping to the database
 */
class ISO_3166_1 {

    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version

    /* Automatic timestamping of GORM */
    //	Date	dateCreated
    //	Date	lastUpdated
    String name
    String alpha2
    String alpha3
    int code
    SubContinent subContinent

    //	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        name sqlType: "text"
        sort "name"
    }

    static constraints = {
        alpha2 size: 0..2, unique: true
        alpha3 size: 0..3, unique: true
        code unique: true
        subContinent nullable: true
    }

    /*
     * Methods of the Domain Class
     */
	
	static ISO_3166_1 getDefault() {
		ISO_3166_1.findByAlpha2("US")
	}

    public Boolean isUSA() {
        return alpha2 == "US"
    }

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}";
    }
}
