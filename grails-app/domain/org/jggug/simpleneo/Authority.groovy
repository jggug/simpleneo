package org.jggug.simpleneo

class Authority {

	String authority
	String name

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
		name nullable:true, blank:true
	}
}
