shinyUI(fluidPage(
        titlePanel("Body Mass Index (BMI)"),
        mainPanel( 
               
        tabsetPanel(
                tabPanel("Metric", 
                         br(),
                         sliderInput("height", label = "Height [m]",min = 1.4, max =2.1, value = 1.7,width = "100%"),
                         sliderInput("weight", label = "Weight [kg]",min = 40, max =160, value = 70,width = "100%"),
                         h4("Results"),
                         textOutput("text1")),
                tabPanel("Imperial", 
                         br(),
                         fixedRow(column(
                                 sliderInput("heightIF", label = "Height [Feet]",min = 4, max =7, value = 6,width = "100%",step = 1),width =6),
                                 column(
                                 sliderInput("heightII", label = "Height [Inches]",min =0, max = 11, value = 0,width = "100%"),width =6)),
                         sliderInput("weightI", label = "Weight [pound]",min = 90, max =350, value = 150,width = "100%"),
                         h4("Results"),
                         textOutput("text1I"))
        )
        
        ),
                
                # Sidebar with a slider input
                sidebarPanel(
                        h4("Description"),
                        p("The BMI is used to classify a person as underweight, normal weight, overweight or obese. The BMI value is calculated 
                          from the height and weight of a person."),
                        h4("Instructions"),
                        tags$ol(
                                tags$li("Select imperial or metric system to your preference."), 
                                tags$li("Move the top slider to your height in meters or the top two sliders to Feet and inches (if you chose the imperial system)."), 
                                tags$li("Move the bottom slider to your weight in kilograms or pounds (if you chose the imperial system)."), 
                                tags$li("Your BMI and BMI classification will be displayed in the results section.")
                        ),
                       h4("Reference"),
                        a("BMI on Wikipedia",href="https://en.wikipedia.org/wiki/Body_mass_index",target="_blank")
                )
))