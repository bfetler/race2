package race2

class State {

    String name

    static constraints = {
	name(minSize:2, maxSize:2, blank:false)
    }

    String toString() {
	name
    }
}
