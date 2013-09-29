package com.grails.mongo.blog

class PostTagLib {

    static namespace = "post"

    def postsCount = { attrs ->
        boolean active = attrs.active
        out << Post.countByActive(active)
    }
}
