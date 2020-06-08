#Ravuri Maheshbabu
#My second project 


#call the library

library(shiny)

data("Orange")


#let's write the code for input 


ui <- fluidPage(
    titlePanel(" circumference"),
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "bins",
                        label = "no of bins",
                        min =20 ,
                        max = 250,
                        value = 150,
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
        x    <- Orange$circumference
        x    <- na.omit(x)
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "green", border = "red",
             xlab = "circumference",
             main = "Histogram of orange circumference")
    })
}


#write the code for runapp

shinyApp(ui = ui, server = server)