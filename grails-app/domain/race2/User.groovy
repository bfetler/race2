package race2

class User {
    String login
    String password
    String role = "user"
    String captain

    static constraints = {
	login(blank:false, nullable:false, unique:true)
	password(blank:false, password:true)
	role(inList:["admin", "user"])
	captain()
    }

    static transients = ['admin']
// for accessor/mutator methods (get/set/is) e.g. isAdmin()
//   GORM automatically looks for field in db
// transients = ...   prevents that

    boolean isAdmin() {
	return role == "admin"
    }

    def beforeInsert = {
	password = password.encodeAsSHA()
    }

    String toString() {
	login
    }
}
