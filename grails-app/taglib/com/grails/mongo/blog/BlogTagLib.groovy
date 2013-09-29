package com.grails.mongo.blog

class BlogTagLib {
    static namespace = "blog"

    def settings = { attrs ->
        BlogSetting settings = BlogSetting.get(BlogSetting.SETTINGS_ID)
        out << settings."${attrs.name}"
    }
}
