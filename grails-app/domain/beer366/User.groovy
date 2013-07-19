package beer366

import java.security.SecureRandom;

class User {
    static searchable = true

    transient springSecurityService

    //Native Spring Security User fields
    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    //Custom fields
    String salt
    String email
    String homepage
    String firstName
    String lastName
    Date dateCreated
    Date lastLogin

    //Services
    def beer366Service

    static constraints = {
        username blank: false, unique: true, size: 2..15
        email email: true, unique: true
        homepage nullable: true
        firstName blank: false
        lastName blank: false
        password blank: false
        lastLogin nullable: true
    }

    static mapping = {
        // password is a keyword in some sql dialects, so quote with backticks
        // password is stored as 44-char base64 hashed value
        password column: '`password`', sqlType: "text"
        salt sqlType: "text"
        homepage sqlType: "text"
        firstName sqlType: "text"
        lastName sqlType: "text"
        sort "username"
    }

    List<Beer> getUniqueBeers() {
        List uniqueBeerIDs = beer366Service.userUniqueBeers( this ).get( this.id ).asList()
        Beer.getAll(uniqueBeerIDs).asList()
    }

    List<Beer> getGloballyUniqueBeers() {
        List globalUniqueBeerIDs = beer366Service.userGlobalUniqueBeers( this ).get( this.id ).asList()
        Beer.getAll(globalUniqueBeerIDs).asList()
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    String getSalt() {
        if (!salt) {
            def rnd = new byte[48];
            new SecureRandom().nextBytes(rnd)
            salt = rnd.encodeBase64()
        }
        salt
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password, salt)
    }

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${username}";
    }
}
