package com.grails.mongo.blog

class PageService {

    static transactional = false

    def getPostCount() {

        Post.collection
    }
}
