package com.grails.mongo.blog

import grails.test.mixin.*

@TestFor(PostsController)
@Mock(Post)
class PostsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/post/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.postInstanceList.size() == 0
        assert model.postInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.postInstance != null
    }

    void testSave() {
        controller.save()

        assert model.postInstance != null
        assert view == '/post/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/post/show/1'
        assert controller.flash.message != null
        assert Post.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/post/list'

        populateValidParams(params)
        def post = new Post(params)

        assert post.save() != null

        params.id = post.id

        def model = controller.show()

        assert model.postInstance == post
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/post/list'

        populateValidParams(params)
        def post = new Post(params)

        assert post.save() != null

        params.id = post.id

        def model = controller.edit()

        assert model.postInstance == post
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/post/list'

        response.reset()

        populateValidParams(params)
        def post = new Post(params)

        assert post.save() != null

        // test invalid parameters in update
        params.id = post.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/post/edit"
        assert model.postInstance != null

        post.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/post/show/$post.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        post.clearErrors()

        populateValidParams(params)
        params.id = post.id
        params.version = -1
        controller.update()

        assert view == "/post/edit"
        assert model.postInstance != null
        assert model.postInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/post/list'

        response.reset()

        populateValidParams(params)
        def post = new Post(params)

        assert post.save() != null
        assert Post.count() == 1

        params.id = post.id

        controller.delete()

        assert Post.count() == 0
        assert Post.get(post.id) == null
        assert response.redirectedUrl == '/post/list'
    }
}
