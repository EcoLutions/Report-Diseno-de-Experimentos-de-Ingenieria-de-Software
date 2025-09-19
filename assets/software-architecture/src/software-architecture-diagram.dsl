workspace "EcoLutions" "Description" {

    model {
        citizen = person "Citizen" "A user of the solution with citizen account"
        municipalEmployee = person "Municipal Employee" "An employee of the municipality, with admin account"

        ecolutions = softwareSystem "EcoLutions" {
            webApp = container "Web Application" "Delivers the dynamic content to Ecolutions single page application" "Angular 20"
            mobileApp = container "Mobile Application" "" "Flutter"

            apiApp = container "API Application" "Provides functionality via JSON/HTTPS API" "Python - FastAPI" "API Application" {
                accessBc = component "Access Bounded Context" "Handles user authentication, authorization, and profile management" "Java - Spring Boot"
                monitoringBc = component "Monitoring Bounded Context" "Manages container tracking, status updates, and monitoring functionalities" "Java - Spring Boot"
                simulationBc = component "Simulation Bounded Context" "Handles route simulation, optimization algorithms, and related functionalities" "Java - Spring Boot"
                iotDeviceBc = component "IoT Device Bounded Context" "Manages interactions with IoT devices, data collection, and device status" "Java - Spring Boot"
            }

            database = container "Database" "Stores user information, authentication credentials, access, etc" "MySQL Database Schema" "Database"
        }
        pushNotification = softwareSystem "Push Notification System" "" "Push"
        openStreetMap = softwareSystem "Open Street Map" "API" "Open Street"
        authentication = softwareSystem "Authentication" "API" "Authentication"
        openAi = softwareSystem "Open AI" "API" "Open AI"

        // Context
        citizen -> ecolutions "Views available containers, map diagrams"
        municipalEmployee -> ecolutions "Views reports, containers administration, simulate routes"

        ecolutions -> pushNotification "Sends notification using"
        ecolutions -> openStreetMap "Gets map information"
        ecolutions -> authentication "Uses OAuth" "Token"
        ecolutions -> openAi "Uses GPT-4o mini model" "HTTPS"

        pushNotification -> citizen "Sends notifications to"

        // Containers
        citizen -> mobileApp "Uses"
        municipalEmployee -> webApp "Uses"

        mobileApp -> apiApp "Makes API calls to" "JSON/HTTPS"
        webApp -> apiApp "Makes API calls to" "JSON/HTTPS"

        apiApp -> database "Reads from and writes to" "JDBC"

        apiApp -> pushNotification "Uses"
        apiApp -> openStreetMap "Uses"
        apiApp -> authentication "Uses"
        apiApp -> openAi "Uses"

        pushNotification -> mobileApp "Send push notifications"

        // Components
        webApp -> accessBc "Makes API calls to" "JSON/HTTPS"
        webApp -> monitoringBc "Makes API calls to" "JSON/HTTPS"
        webApp -> simulationBc "Makes API calls to" "JSON/HTTPS"
        webApp -> iotDeviceBc "Makes API calls to" "JSON/HTTPS"
        mobileApp -> accessBc "Makes API calls to" "JSON/HTTPS"
        mobileApp -> monitoringBc "Makes API calls to" "JSON/HTTPS"
        mobileApp -> simulationBc "Makes API calls to" "JSON/HTTPS"
        mobileApp -> iotDeviceBc "Makes API calls to" "JSON/HTTPS"
        accessBc -> database "Reads from and writes to" "JDBC"
        monitoringBc -> database "Reads from and writes to" "JDBC"
        simulationBc -> database "Reads from and writes to" "JDBC"
        iotDeviceBc -> database "Reads from and writes to" "JDBC"
    }

    views {
        systemContext ecolutions {
            include *
            autolayout
        }

        container ecolutions {
            include *
            autolayout
        }

        component apiApp {
            include *
            autolayout
        }

        styles {
            element "Push" {
                background "#E8D957"
            }
            element "Open Street" {
                background "#E8D957"
            }
            element "Authentication" {
                background "#E8D957"
            }
            element "Open AI" {
                background "#E8D957"
            }
            element "API Application" {
                background "#26CF48"
            }
            element "Database" {
                shape "Cylinder"
                background "#EC0E0E"
            }
        }

        theme default
    }

    configuration {
        scope softwaresystem
    }

}