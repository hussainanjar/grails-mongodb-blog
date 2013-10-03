package com.grails.mongo.blog

class PostsController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        forward(action: "list")
    }

    def list(Integer max, Integer offset) {
        params.max = Math.min(max ?: 2, 10)
        params.offset = offset?:0

        def postList = Post.collection.find([active:true], [comments: 0]).limit(params.max).skip(params.offset).sort(dateCreated:-1)

        render(view: "/blog/posts/index", model: [posts: postList, postTotal: Post.count()])
    }

    def show(String slug) {
        Post post
        User user = springSecurityService.getCurrentUser()
        if (user && user.isAdmin()) {
            post = Post.collection.findOne(slug: slug) as Post
        } else {
            post = Post.collection.findOne(slug: slug, active:true) as Post
        }
        if (!post) {
            response.sendError(404)
        }

        render(view: "/blog/posts/post", model: [post: post])
    }

    def tags(String tag) {
        def posts = Post.collection.find(tags: tag, active: true)
        render(view: "/blog/posts/index", model: [posts: posts])
    }

    def addComment(String postSlug) {
        log.debug("Adding comment for post ${postSlug}")
        Post post = Post.findBySlug(postSlug)
        log.debug("validate ${post.validate()} ${post.errors}")
        if (post) {
            params.remove("id") // making sure id is removed so old comment is not updated
            Comment comment = new Comment(params)
            comment.dateCreated = new Date()
            post.commentsCount = (post.commentsCount?:0) + 1
            post.comments.add(comment)
            post.save(failOnError: true)
            log.debug("Comment ${post.commentsCount} add for post ${postSlug}")
        }

        redirect(action: "show", params: [slug:postSlug])
    }

    /*def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [postInstanceList: Post.list(params), postInstanceTotal: Post.count()]
    }

    def create() {
        [postInstance: new Post(params)]
    }

    def save() {
        println("tag cont : " + params.tagList)
        def postInstance = new Post(params)
        postInstance.tagList = params.tagList
        if (!postInstance.save(flush: true)) {
            render(view: "create", model: [postInstance: postInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
        redirect(action: "show", id: postInstance.id)
    }

    def show(Long id) {
        def postInstance = Post.get(id)
        if (!postInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        [postInstance: postInstance]
    }

    def edit(Long id) {
        def postInstance = Post.get(id)
        if (!postInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        [postInstance: postInstance]
    }

    def update(Long id, Long version) {
        println("tag cont : " + params.tagList)
        def postInstance = Post.get(id)
        postInstance.tagList = params.tagList
        if (!postInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (postInstance.version > version) {
                postInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'post.label', default: 'Post')] as Object[],
                          "Another user has updated this Post while you were editing")
                render(view: "edit", model: [postInstance: postInstance])
                return
            }
        }

        postInstance.properties = params

        if (!postInstance.save(flush: true)) {
            render(view: "edit", model: [postInstance: postInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
        redirect(action: "show", id: postInstance.id)
    }

    def delete(Long id) {
        def postInstance = Post.get(id)
        if (!postInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        try {
            postInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "show", id: id)
        }
    }*/
}
