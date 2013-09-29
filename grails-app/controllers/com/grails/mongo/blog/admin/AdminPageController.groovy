package com.grails.mongo.blog.admin

import com.grails.mongo.blog.Page
import com.grails.mongo.blog.Page
import org.springframework.data.mongodb.MongoDataIntegrityViolationException

class AdminPageController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        forward(action: "list")
    }

    def list(Integer max, Integer offset) {
        params.max = Math.min(max ?: 10, 100)

        render(view: "/admin/page/index", model: [pageList: Page.list(params), pageTotal: Page.count()])
    }

    def create() {
        render(view: "/admin/page/create", model: [page: new Page(params)])
    }

    def save() {
        def pageInstance
        if (params.id) {
            pageInstance = Page.get(params.long('id'))
            if (!pageInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
                redirect(action: "list")
                return
            }
        } else {
            pageInstance = new Page()
        }
        pageInstance.properties = params
        if (!pageInstance.save()) {
            render(view: "/admin/page/create", model: [page: pageInstance])
            return
        }

        flash.message = message(code: 'default.simple.created.message', args: [message(code: 'page.label', default: 'Page')])
        redirect(action: "list")
    }

    def edit(String id) {
        def pageInstance = Page.get(id)
        if (!pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/page/create", model: [page: pageInstance])
    }

    def delete(String id) {
        def pageInstance = Page.get(id)
        if (!pageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
            return
        }

        try {
            pageInstance.delete()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'page.label', default: 'Page'), pageInstance.slug])
            redirect(action: "list")
        }
        catch (MongoDataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'page.label', default: 'Page'), id])
            redirect(action: "list")
        }
    }
}
