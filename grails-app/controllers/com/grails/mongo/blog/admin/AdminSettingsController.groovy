package com.grails.mongo.blog.admin

import com.grails.mongo.blog.BlogSetting

class AdminSettingsController {

    def index() {
        BlogSetting settings = BlogSetting.get(BlogSetting.SETTINGS_ID) ?: new BlogSetting()
        render view: "/admin/settings/index", model: [settings: settings]
    }

    def updateSettings() {
        BlogSetting settings = BlogSetting.get(BlogSetting.SETTINGS_ID) ?: new BlogSetting()
        settings.properties = params
        if (settings.save()) {
            flash.message = g.message(code: "blogSetting.update.success", default: "Settings successfully updated")
            redirect(action: 'index')
        } else {
            render view: "/admin/settings/index", model: [settings: settings]
        }
    }
}
