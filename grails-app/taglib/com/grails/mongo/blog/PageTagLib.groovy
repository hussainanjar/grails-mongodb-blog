package com.grails.mongo.blog

class PageTagLib {

    static namespace = "page"

    def pagesCount = { attrs ->
        boolean active = attrs.active
        out << Page.countByActive(active)
    }
}
