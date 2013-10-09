package com.grails.mongo.blog.admin

import com.grails.mongo.blog.Post
import org.springframework.data.mongodb.MongoDataIntegrityViolationException

class AdminPostController {

    static allowedMethods = [save: "POST", delete: "POST"]

    def springSecurityService

    def index() {
        forward(action: "list")
    }

    def list(Integer max, Integer offset) {
        params.max = Math.min(max ?: 10, 10)
        params.offset = offset?:0

        def postList = Post.collection.find([:], [comments: 0]).limit(params.max).skip(params.offset).sort(dateCreated:-1)

        render(view: "/admin/post/index", model: [postList: postList, postTotal: Post.count()])
    }

    def create() {
        render(view: "/admin/post/create", model: [post: new Post(params)])
    }

    def save() {
        def postInstance
        String successMsg
        if (params.id) {
            postInstance = Post.get(params.id)
            if (!postInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
                redirect(action: "list")
                return
            }
            successMsg = message(code: 'default.simple.updated.message', args: [message(code: 'post.label', default: 'Post')])
        } else {
            postInstance = new Post()
            postInstance.author = springSecurityService.getCurrentUser().username
            successMsg = message(code: 'default.simple.created.message', args: [message(code: 'post.label', default: 'Post')])
        }
        postInstance.properties = params
        postInstance.tagList = params.tagList
        if (!postInstance.save()) {
            render(view: "/admin/post/create", model: [postInstance: postInstance])
            return
        }

        flash.message = successMsg
        redirect(action: "list")
    }

    def edit(String id) {
        def postInstance = Post.get(id)
        if (!postInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/post/create", model: [post: postInstance])
    }

    def delete(String id) {
        def postInstance = Post.get(id)
        if (!postInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        try {
            postInstance.delete()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
        }
        catch (MongoDataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
        }
    }
}
