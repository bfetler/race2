package race2

class RaceController {

    def scaffold = Race

//    def index = {
//	render "Hello World"
//	if (session.user.admin) {
//	    redirect(controller:"race", action:"list")
//	} else {
//	    redirect(controller:"race", action:"searchlist")
//	}
//    }

// for use with searchable plugin
    def search = {
//	render Race.search(params.q, params)
	flash.message = "Search results for: ${params.q}"
	def resultsMap = Race.search(params.q, params)
	render(view:'listsearch', model:[
             raceInstanceList:resultsMap.results,
             raceInstanceTotal:Race.countHits(params.q)
           ]
	)
    }

    def list = {
	params.max = Math.min(params.max ? params.int('max') : 10, 100)
	if (session?.user?.admin) {
	  render(view:'list', model:[
	    raceInstanceList: Race.list(params),
	    raceInstanceTotal: Race.count()
	  ])
	} else {
	  render(view:'listsearch', model:[
	    raceInstanceList: Race.list(params),
	    raceInstanceTotal: Race.count()
	  ])
	}
    }


    def create = {
	def raceInstance = new Race()
	raceInstance.properties = params
	def stateList = State.list()
//	def stateList = State.getAll()
	return [raceInstance:raceInstance, stateList:stateList]
    }

    def edit = {
        def raceInstance = Race.get(params.id)
	def stateList = State.getAll()
        if (!raceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [raceInstance:raceInstance, stateList:stateList]
        }
    }

}
