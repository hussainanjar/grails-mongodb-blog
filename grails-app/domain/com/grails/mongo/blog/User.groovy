package com.grails.mongo.blog

import org.bson.types.ObjectId

class User {

	transient springSecurityService

    String id
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    String email
    String name

	static constraints = {
		username blank: false, unique: true
		password blank: false
        email blank: false, nullable: false
	}

    static transients = ["isAdmin"]

	static mapping = {
        username index: true, indexAttributes: [unique:true, dropDups:true]
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
        def existing = User.collection?.findOne(id)?.password
        if ( !existing || existing != password ) {
            encodePassword()
        }
	}

    def isAdmin() {
        def auths = getAuthorities()
        boolean hasAdminRole = false
        auths.each { role ->
            if ('ROLE_ADMIN'.equals(role.authority.trim())) {
                hasAdminRole =  true
            }
        }
        return hasAdminRole
    }

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
