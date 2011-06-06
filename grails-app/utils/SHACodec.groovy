// package race2

// package was missing from description, needed for tests
// also need grails clean to compile after changes
// note package must be removed for run-app

import java.security.MessageDigest

class SHACodec {
    static encode = { target ->
	MessageDigest md = MessageDigest.getInstance('SHA')
	md.update(target.getBytes('UTF-8'))
	return new String(md.digest()).encodeAsBase64()
    }

// no decode{} closure, but how hard would it be
//   to write one?  is this really secure?
//    static decode = { target ->
//	MessageDigest md = MessageDigest.getInstance('SHA')
//	md.update(target.getBytes('UTF-8'))
//	return new String(md.digest()).decodeBase64()
//    }
}
