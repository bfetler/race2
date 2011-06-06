package race2

import grails.test.*
// SHA test works after adding next line
import org.codehaus.groovy.grails.plugins.codecs.*

class UserTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
// SHA test works after adding six lines
	String.metaClass.encodeAsBase64 = {->
	  Base64Codec.encode(delegate)
	}
	String.metaClass.encodeAsSHA = {->
	  SHACodec.encode(delegate)
	}
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }

    void testSimpleConstraints() {
// helpful to add mock before everything else to pick up role error
	mockForConstraintsTests(User)
// original test didn't have mock
        def user = new User(login:"someone",
                            password:"blah",
                            role:"SuperUser")
// oops—role should be either 'admin' or 'user'
// will the validation pick that up?
        assertFalse user.validate()
// helpful to add additional line to check role? doesn't do much
	assertEquals "inList", user.errors["role"]
    }

    void testUniqueConstraint() {
          def jdoe = new User(login:"jdoe", password:"pword".encodeAsSHA())
          def admin = new User(login:"admin", password:"wordp".encodeAsSHA())
          mockDomain(User, [jdoe, admin])
          def badUser = new User(login:"jdoe")
          badUser.save()
          assertEquals 2, User.count()
          assertEquals "unique", badUser.errors["login"]
          def goodUser = new User(login:"good",password:"abc123".encodeAsSHA())
// used to contain password, fails using SHA authentication
// works after adding encodeAsSHA()
          goodUser.save()
          assertEquals 3, User.count()
          assertNotNull User.findByLogin("good")
    }

}
