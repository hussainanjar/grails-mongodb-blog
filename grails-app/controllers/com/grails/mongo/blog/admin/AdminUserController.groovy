package com.grails.mongo.blog.admin

import com.grails.mongo.blog.User
import org.springframework.data.mongodb.MongoDataIntegrityViolationException

class AdminUserController {

    def springSecurityService

    def index() {
        forward(action: "list")
    }

    def list(Integer max, Integer offset) {
        params.max = Math.min(max ?: 10, 100)

        render(view: "/admin/user/index", model: [userList: User.list(params), userTotal: User.count()])
    }

    def create() {
        render(view: "/admin/user/create", model: [user: new User(params)])
    }

    def updateProfile() {
        def currentUser = springSecurityService.getCurrentUser()
        if (!currentUser) {
            redirect(controller: "login")
            return
        }
        User userInstance = User.get(currentUser.id)
        userInstance.properties = params
        if (!userInstance.save(failOnError: true)) {
            render(view: "/admin/user/create", model: [user: userInstance])
            return
        }

        flash.message = message(code: 'default.simple.updated.message', args: [message(code: 'user.label', default: 'User')])
        redirect(action: "profile")
    }

    def profile() {
        def currentUser = springSecurityService.getCurrentUser()
        if (currentUser) {
            render(view: "/admin/user/create", model: [user: currentUser])
        } else {
            redirect(controller: 'login')
        }
    }

    def edit(String id) {
        def userInstance = User.get(id)
            println(userInstance)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        render(view: "/admin/user/create", model: [user: userInstance])
    }

    def password() {
        User currentUser = springSecurityService.getCurrentUser()
        if (currentUser) {
            render(view: "/admin/user/password", model: [user: currentUser])
        } else {
            redirect(controller: 'login')
        }

    }

    def updatePassword(String currentPassword, String newPassword, String confirmPassword) {
        User currentUser = User.get(springSecurityService.getCurrentUser().id)
        if (currentUser.password.equals(springSecurityService.encodePassword(currentPassword))) {
            if (newPassword.equals(confirmPassword)) {
                currentUser.password = newPassword
                currentUser.save()
                flash.message = message(code: 'user.password.changed.success', default: 'Password updated successfully')
                redirect(action: 'password')
            } else {
                flash.error = message(code: 'user.password.mismatch.error', default: 'New and Confirm password do not match')
                redirect(action: 'password')
            }
        } else {
            flash.error = message(code: 'user.password.currentPassword.error', default: 'Current password is incorrect')
            redirect(action: 'password')
        }
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (MongoDataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
    }
}
