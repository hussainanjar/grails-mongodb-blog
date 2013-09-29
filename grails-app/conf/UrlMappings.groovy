class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/admin/"{
            controller="admin"
        }

        "/admin/post/$action?/$id?"{
            controller="adminPost"
        }

        "/admin/page/$action?/$id?"{
            controller="adminPage"
        }

        "/admin/user/$action?/$id?"{
            controller="adminUser"
        }

        "/admin/settings/$action?/$id?"{
            controller="adminSettings"
        }

        "/posts/add-comments" {
            controller= "posts"
            action= "addComment"
        }

        "/posts/$slug" {
            controller= "posts"
            action= "show"
        }

        "/posts/tags/$tag" {
            controller="posts"
            action="tags"
        }

        "/$slug" {
            controller="pages"
            action="index"
        }

		"/"(controller: "posts", action: 'index')
		"500"(view:'/error')
        "404"(view:'/404')
	}
}
