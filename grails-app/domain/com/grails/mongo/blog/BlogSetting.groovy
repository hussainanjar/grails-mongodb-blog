package com.grails.mongo.blog

/**
 * Created with IntelliJ IDEA.
 * User: hussain
 * Date: 9/22/13
 * Time: 8:13 PM
 * To change this template use File | Settings | File Templates.
 */
class BlogSetting {
    static final Long SETTINGS_ID = 1
    Long id = SETTINGS_ID
    String blogTitle
    Integer postsPerPage
    String footerContent
    String scripts

    static constraints = {
        id generator: 'assigned'
        scripts nullable: true
    }
}
