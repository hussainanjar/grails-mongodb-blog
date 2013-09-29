package com.grails.mongo.blog

class UserTagLib {

    def springSecurityService

    static namespace = "u"

    static returnObjectForTags = ['loggedInUser']

    def loggedInUser = { attrs ->
        return springSecurityService.getCurrentUser()
    }
}
