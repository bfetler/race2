package race2

class Runner {

    String firstName
    String lastName
    Date dateOfBirth
    String gender
    String address
    String city
    String state
    String zipcode
    String email

    static constraints = {
	firstName(blank:false)
	lastName(blank:false)
	dateOfBirth()
	gender(inList:["M", "F"])
	email(email:true)
	address()
	city()
	state()
	zipcode()
    }

    static hasMany = [registrations: Registration]

    String toString() {
//	"${lastName}, ${firstName} (${email})"
	"${lastName}, ${firstName}"
    }
}
