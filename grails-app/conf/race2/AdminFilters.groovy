package race2

class AdminFilters {

    def filters = {
        adminOnly(controller:'*', 
		action:"(create|edit|update|delete|save)") {
// note above line is a regexp, not a list
            before = {  // before action is executed
                if (!session?.user?.admin) {
		    flash.message = "Sorry, admin only"
		    redirect(controller:"race", action:"list")
		    return false
		}
            }
            after = {  // after action, before view is rendered
            }
            afterView = {  // after view is rendered
            }
        }
    }
    
}
