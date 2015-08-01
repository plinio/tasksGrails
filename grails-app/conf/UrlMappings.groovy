class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller:"task", action:"index")
        "/"(view:"/index")
        "500"(view:'/error')

        "/index/save"(controller:"task", action:"save")
        "/index/delete"(controller:"task", action:"delete")
	}
}
