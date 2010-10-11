class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/display/$id"(controller:"page", action:"findByTitle")
		"/create/$name"(controller:"page", action:"createPage")
		"/edit/$id"(controller:"page", action:"editPage")

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
