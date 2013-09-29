// environment specific settings
environments {
    development {
        mongo {
            host = "localhost"
            port = 27017
            databaseName = "grails-mongo-blog"
        }
    }
    test {
        mongo {
            host = "localhost"
            port = 27017
            databaseName = "grails-mongo-blog"
        }
    }
    production {
        mongo {
            host = "localhost"
            port = 27017
            databaseName = "grails-mongo-blog"
        }
    }
}
