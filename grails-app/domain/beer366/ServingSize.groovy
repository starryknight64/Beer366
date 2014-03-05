package beer366

/**
 * ServingSize
 * A domain class describes the data object and it's mapping to the database
 */
class ServingSize {

    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version

    /* Automatic timestamping of GORM */
    //	Date	dateCreated
    //	Date	lastUpdated
    String name
    int ml

    //	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        name sqlType: "text"
        sort "ml"
    }

    static constraints = {
        name unique: true
        ml min: 1
    }

    public static ServingSize defaultSize() {
        return ServingSize.findByName("12 oz")
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
		if( name?.toLowerCase() == "${ml} ml" ) {
			return name
		}
        return "${name} (${ml} mL)";
    }
}
