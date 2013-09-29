package com.grails.mongo.blog

/**
 * Embedded domain used as part of Post
 */
class Comment implements Serializable{

    String name
    String email
    String website
    String content
    Date dateCreated

    static constraints = {
    }


}
