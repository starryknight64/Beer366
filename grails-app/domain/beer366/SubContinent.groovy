package beer366

/**
 * SubContinent
 * A domain class describes the data object and it's mapping to the database
 */
class SubContinent {

    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version

    /* Automatic timestamping of GORM */
    //	Date	dateCreated
    //	Date	lastUpdated
    String code
    String name
    Continent continent

    //	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        code unique: true
        name sqlType: "text"
        sort "name"
    }

    static constraints = {
        code size: 0..3
    }

    /*
     * Methods of the Domain Class
     */
    //	@Override	// Override toString for a nicer / more descriptive UI
    //	public String toString() {
    //		return "${name}";
    //	}
}
