fluidPage(
        # Application title
        titlePanel("Word Cloud"),
        
        sidebarLayout(
                # Sidebar with a slider and selection inputs
                sidebarPanel(
                        selectInput("selection", "Choose a Poet:",
                                    choices = poets),
                        actionButton("update", "Change"),
                        hr(),
                        sliderInput("freq",
                                    "Minimum Frequency:",
                                    min = 1,  max = 100, value = 50),
                        sliderInput("max",
                                    "Maximum Number of Words:",
                                    min = 1,  max = 100,  value = 20)
                ),
                
                # Show Word Cloud
                mainPanel(
                        tabsetPanel(type="tabs",
                        tabPanel("Application",
                                 plotOutput("plot","800px", "600px")
                                 ),
                # Documentation for how the app works
                        tabPanel(
                                "Documentation",
                                mainPanel(includeMarkdown("README.md"))
                                )
                        )))
)