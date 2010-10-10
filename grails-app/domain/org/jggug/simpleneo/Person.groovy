package org.jggug.simpleneo

class Person {

	String username
	String userRealName
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		userRealName blank: false
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}
}
