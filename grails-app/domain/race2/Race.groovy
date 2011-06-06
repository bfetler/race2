package race2

class Race {

    static searchable = true  // for use with searchable plugin

    String name
    Date startDate
    String city
    String state
    BigDecimal distance
    BigDecimal cost
    Integer maxRunners = 100000

    static constraints = {
	name(blank:false, maxSize:50)
	startDate(validator: {return (it > new Date()) })
	city(blank:false, maxSize:100)
	state(minSize:2, maxSize:2)
//	state(inList:["CA","OR","NV","WA"])
//	state(inList:State.findAll())
//	state(inList:stateList())
	distance(min:0.0)
	cost(min:0.0, max:100.0)
	maxRunners(min:0, max:100000)
    }

    static hasMany = [registrations: Registration]
// goes with belongsTo in Registration class

    static transients = ['stateList']
    static List stateList() {
	List list = race2.State.findAll()
	if (!list)
	    list=["CA","OR","WA"]
	return list
    }

    String toString() {
	return "${name}, ${startDate.format('MM/dd/yyyy')}"
    }

    BigDecimal inMiles() {
	return distance * 0.6214
    }

// return list of Races in a specific sort order
    static mapping = {
	sort "startDate"
    }

}
