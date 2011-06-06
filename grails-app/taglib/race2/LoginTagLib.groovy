package race2

class LoginTagLib {

  def loginControl = {
    if(request.getSession(false) && session.user){
      out << "User ${session.user.login} "
      out << """[${link(action:"logout",
        controller:"user"){"Logout"}}]"""
    } else {
      out << """[${link(action:"login",
        controller:"user"){"Login"}}]"""
    }
  }

  def adminControl = {
    if(request.getSession(false) && session.user){
      out << """<span class="headerButton"> ${link(action:"list",
                controller:"race"){"Race List"}} </span>"""
      out << """<span class="headerButton"> ${link(action:"list",
                controller:"runner"){"Runner List"}} </span>"""
      out << """<span class="headerButton"> ${link(action:"list",
                controller:"registration"){"Registration List"}} </span>"""
      out << """<span class="headerButton"> ${link(action:"list",
                controller:"user"){"User List"}} </span>"""
      out << """<span class="headerButton"> ${link(action:"index",
                controller:"state"){"State List"}}</span>"""
      out << """<span class="headerButton"> ${link(action:"index",
                controller:"admin"){"Admin"}} </span>"""
    }
  }

  def adminCtrl = {
    if(request.getSession(false) && session.user){
      out << "<h3>"
      out << """[${link(action:"list",
                controller:"race"){"Race List"}}]"""
      out << """[${link(action:"list",
                controller:"runner"){"Runner List"}}]"""
      out << """[${link(action:"list",
                controller:"registration"){"Registration List"}}]"""
      out << """[${link(action:"list",
                controller:"user"){"User List"}}]"""
      out << """[${link(action:"index",
                controller:"state"){"State List"}}]"""
      out << """[${link(action:"index",
                controller:"admin"){"Admin"}}]"""
      out << "</h3>"

//      out << """<span class="menuButton"> ${link(action:"list",
//                controller:"race"){"Race List"}} </span>"""

//      out << "<h3>"
//      out << """${link(action:"list",
//                controller:"race"){"<button>Race List</button>"}}"""
//      out << """${link(action:"list",
//                controller:"runner"){"<button>Runner List</button>"}}"""
//      out << """${link(action:"list",
//                controller:"registration"){"<button>Registration List</button>"}}"""
//      out << """${link(action:"list",
//                controller:"user"){"<button>User List</button>"}}"""
//      out << """${link(action:"index",
//                controller:"state"){"<button>State List</button>"}}"""
//      out << """${link(action:"index",
//                controller:"admin"){"<button>Admin</button>"}}"""
//      out << "</h3>"

    }
  }

}
