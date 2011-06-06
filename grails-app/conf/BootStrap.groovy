class BootStrap {

// called when grails starts
    def init = { servletContext ->
// use fullpath to GrailsUtil, but could import
	switch(grails.util.GrailsUtil.environment) {
//	    case "development":
// if development, it will create multiple objects
// in the db, except for id.  use only if DataSource is create-drop
	    case "development_save":
		def jane = new race2.Runner(
		    firstName:	"Jane",
		    lastName:	"Doe",
		    dateOfBirth:(new Date() - 365*30),
		    gender:	"F",
		    address:	"123 B St",
		    city:	"San Mateo",
		    state:	"CA",
		    zipcode:	"94115",
		    email:	"jane.doe@runners.org"
		    )
		jane.save()
		if (jane.hasErrors()) {
		    println jane.errors
		}

		def zany = new race2.Race(
		    name:	"Zany Brainy",
		    startDate:	(new Date() + 90),
		    city:	"San Francisco",
		    state:	"CA",
		    distance:	10,
		    cost:	20,
		    maxRunners:	5000
		    )
		zany.save()
		if (zany.hasErrors()) {
		    println zany.errors
		}
		break

	    case "production":
		break
	}
    }

// called when grails stops
    def destroy = {
    }
}
