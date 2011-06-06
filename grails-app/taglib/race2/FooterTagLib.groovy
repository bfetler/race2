package race2

class FooterTagLib {

  def thisYear = {
    out << new Date().format("yyyy")
  }

  def copyright = {attrs, body->
    out << "&copy; " + attrs.startYear + " - "
    out << thisYear() + " " + body() // body().encodeAsUnderscore()
// encodeAsUnderscore() from utils/UnderscoreCodec
// attrs is attribute-value pairs in gsp tag, e.g.
//    startYear="1999"
// body() is body of tag, text within <g:> e.g.
//   <g:copyright> body of tag </g:copyright>
  }

}
