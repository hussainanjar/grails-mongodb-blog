package com.grails.mongo.blog

class PagesController {

    def springSecurityService

    def index(String slug) {
        Page page
        User currentUser = springSecurityService.getCurrentUser()
        if (currentUser && currentUser.isAdmin()) {
            page = Page.findBySlug(slug)
        } else {
            page = Page.findBySlugAndActive(slug, true)
        }

        if (!page) {
            response.sendError(404)
        }

        render(view: "/blog/pages/index", model: [page:page])
    }
}
