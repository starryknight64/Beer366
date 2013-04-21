package beer366

class Role {

    String authority

    static mapping = {
        cache true
        sort "authority"
    }

    static constraints = {
        authority blank: false, unique: true
    }

    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${authority}";
    }
}
