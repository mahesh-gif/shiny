#Ravuri Maheshbabu
#My second project 


#call the library

library(shiny)

data("airquality")


#let's write the code for input 


ui <- fluidPage(
    titlePanel("Ozone level"),
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "bins",
                        label = "no of bins",
                        min =1 ,
                        max = 50,
                        value = 30,
                        )
        ),
        
        mainPanel(
            plotOutput(outputId = "distplot")
        )
        
    )
)


#lets's write code for server


server <- function(input,output) {
    output$distplot <- renderPlot({
        x    <- airquality$Ozone
        x    <- na.omit(x)
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "green", border = "red",
             xlab = "Ozone level",
             main = "Histogram of Ozone level")
    })
}


#write the code for runapp

shinyApp(ui = ui, server = server)