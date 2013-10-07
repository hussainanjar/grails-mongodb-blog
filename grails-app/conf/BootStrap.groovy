import com.grails.mongo.blog.BlogSetting
import com.grails.mongo.blog.Role

import com.grails.mongo.blog.User
import com.grails.mongo.blog.UserRole

class BootStrap {

    def init = { servletContext ->
        def admin = User.findByUsername("admin") ?:
            new User(username: "admin",
                    password: "admin",
                    enabled: true, accountLocked: false,
                    accountExpired: false, passwordExpired: false, email: 'hussain.engr@gmail.com', name: 'Hussain').save(flush: true)

        if (admin && !admin.isAdmin()) {
            Role role = Role.findByAuthority("ROLE_ADMIN") ?:
                new Role(authority: "ROLE_ADMIN").save()

            UserRole.create(admin,role,true)
        }

        def visitor = User.findByUsername("visitor") ?:
            new User(username: "visitor",
                    password: "visitor123",
                    enabled: true, accountLocked: false,
                    accountExpired: false, passwordExpired: false,
                    email: 'visitor@domain.com', name: "Visitor").save();

        if (visitor && !visitor.hasRole('ROLE_VISITOR')) {
            Role role = Role.findByAuthority("ROLE_VISITOR") ?:
                new Role(authority: "ROLE_VISITOR").save()

            UserRole.create(visitor,role,true)
        }

        BlogSetting setting = BlogSetting.get(BlogSetting.SETTINGS_ID) ?:
            new BlogSetting(blogTitle: "Grails MongoDB Blog",
                postsPerPage: 5,
                footerContent: "Blog powered by <a href=\"http://grails.org\">Grails</a> &amp; <a href=\"http://mongodb.org\">MongoDB</a>").save()
    }
    def destroy = {
    }
}
