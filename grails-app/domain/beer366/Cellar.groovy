package beer366

/**
 * Cellar
 * A domain class describes the data object and it's mapping to the database
 */
class Cellar {

    /* Default (injected) attributes of GORM */
    //	Long	id
    //	Long	version

    /* Automatic timestamping of GORM */
    Date	dateCreated
    //	Date	lastUpdated
    User user
    Beer beer
    ServingSize size
    Integer quantity
    Integer willTrade
    String notes
    //    Date timestamp

    static belongsTo	= User	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    //	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
    //	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    //	static mappedBy		= []	// specifies which property should be used in a mapping

    static mapping = {
        notes sqlType: "text"
        sort "beer"
    }

    static constraints = {
        quantity min: 0
        willTrade min: 0, nullable: true, validator: { val, obj ->
            obj.val <= obj.quantity
        }
        notes nullable: true, widget: "textarea"
        beer unique: [ "user" ]
    }

    /*
     * Methods of the Domain Class
     */
    //	@Override	// Override toString for a nicer / more descriptive UI
    //	public String toString() {
    //		return "${name}";
    //	}
}
