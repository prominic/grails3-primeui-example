package grails3primefaces

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        //"/"(redirect:"/test/test.html")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
