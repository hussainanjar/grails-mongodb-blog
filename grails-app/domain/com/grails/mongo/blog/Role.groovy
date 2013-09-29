package com.grails.mongo.blog

import org.bson.types.ObjectId

class Role {

    String id
	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
