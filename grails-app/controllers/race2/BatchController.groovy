package race2

// Batch Registration Controller
class BatchController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
// decrease items per page since checkboxes takes extra room
        params.max = Math.min(params.max ? params.int('max') : 8, 128)
        [registrationInstanceList: Registration.list(params), registrationInstanceTotal: Registration.count()]
    }

    def create = {  // batch create
//        def registrationInstance = new Registration()
//        registrationInstance.properties = params
//        registrationInstance.captain = session?.user?.captain
//        return [registrationInstance:registrationInstance,
//		runnerList:Runner.list(), runnerTotal:Runner.count()]
// don't need to create registrationInstance unless used in views
        return [runnerList:Runner.list(), runnerTotal:Runner.count()]
    }

    def save = {
	String mess="", s
	int count = 0
	Boolean success = false
	Race myrace = Race.get(params.race.id)
//	flash.message = "${message(code: 'default.batchcreated.message', args: [message(code: 'batchregistration.label', default: 'Batch Registration'), registrationInstance.id])}"
//	flash.message = params
//	mess = "params <<"+params.toString()+">> "
	mess += "Runnersize:"+Runner.count()+", rsize:"+params.r.size()+", r: "+params.r
//	if (params.r.size() > Runner.count()) {
//	    for (int i=1; i<=Runner.count(); i++) {
//		s = i.toString()
//		if (params.r[s]) {
//		    mess += ", r"+s
//		    if (params.p[s]) mess += " p"+s 
//		}
//	    }
//	}
// params is a Map
// params.r is a Map, e.g. [_4:, _3:, 2:on, 1:on, _2:, _1:]
	Set<String> rk = params.r.keySet()
	for (String i : rk) {
// line below fails if "i" is not int index
	    if (params.r.get(i)) {
		s = params.r.get(i)
		mess += ", r"+i
//		if (params.p[i]) mess += " p"+i
		if (params.p.get(i)) mess += " p"+i
	    }
	}
	mess += ", save "
	for (String i : rk) {
	    if (params.r.get(i)) {
// java way to do things
//		def regInstance = new Registration()
//		regInstance.captain = params.captain
//		regInstance.race = myrace
//		regInstance.runner = Runner.get(i)
//		if (params.p[i])
//		    regInstance.paid = true
//		else
//		    regInstance.paid = false
// groovy way to do things
		Map newpar = ["captain": params.captain, 
			    "race": myrace,
			    "runner": Runner.get(i)]
		if (params.p[i])
		    newpar.put("paid", true)
		else
		    newpar.put("paid", false)
		def regInstance = new Registration(newpar)
//		regInstance.properties = newpar  // fails

		if (regInstance.save(flush: true)) {
		    success = true
		    count++
		    mess += " r"+i
		} else {
		    success = false
		    mess += " - Cannot save r"+s
		    break;
		}
	    }
	}
	if (success)
	    mess += ", Saved "+ count + " registrations for "+ myrace
	flash.message = mess
//	redirect(action: "list", params: params)
//	redirect(action: "list")  // no params, no junk in url
	redirect(controller:"registration", action:"list")  // no params, no junk in url
    }

    def delete = {
	int count = 0
	String mess = ""
//	mess += params.toString()
//	mess += " "+params.d+" "
	mess += "dsize:"+params.d.size()+" "
	Set<String> s = params.d.keySet()
	mess += s.toString()+" "
	for (String i : s) {
	    if (params.d.get(i)) {
		mess += "i=" + i + ",d=" + params.d.get(i)
	        def registrationInstance = Registration.get(i)
	        if (registrationInstance) {
	            try {
	                registrationInstance.delete(flush: true)
			mess += ",del "
			count++
//	                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
//	                redirect(action: "list")
	            }
	            catch (org.springframework.dao.DataIntegrityViolationException e) {
	                mess = "${message(code: 'default.not.deleted.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
//	                redirect(action: "show", id: params.id)
			break;
	            }
	        }
	        else {
	            mess = "${message(code: 'default.not.found.message', args: [message(code: 'registration.label', default: 'Registration'), params.id])}"
//	            redirect(action: "list")
		    break;
	        }
	    }
	}
	if (count) mess += " Deleted "+count+" registrations"
	flash.message = mess
        redirect(action: "list")
    }
}
