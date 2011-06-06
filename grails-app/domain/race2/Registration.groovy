package race2

class Registration {

//     Race race  // doesn't seem to need it
    Boolean paid
    Date dateCreated
    String captain  // = runner.lastName

    static constraints = {
	race()
	runner()
	captain()
	paid()
	dateCreated()
    }

    static belongsTo = [race:Race, runner:Runner]
// goes along with hasMany in Race class

    String toString() {
//	"${runner.lastName}, ${runner.firstName} (${runner.email})"
	"${runner.lastName}, ${runner.firstName} (${race.name}, ${race.state})"
    }

// disable auto-update of dateCreated, lastUpdated
//    static mapping = {
//	autoTimestamp false
//    }

// some intuitively named closures
    def beforeInsert = {
//	def user = User.findByLoginAndPassword(
//		params.login, params.password.encodeAsSHA())
//	if (user) {
//	    this.captain = user.captain
//	}
    }
//    def beforeValidate(List propertiesToValidate) = {
//    } // since 1.3.6

//    def beforeUpdate = {
//    }
//    def beforeDelete = {
//    }
//    def onLoad = {
//    }

}
