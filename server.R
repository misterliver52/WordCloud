# Selected Material excerpted from each of the following:
# Longfellow, Henry Wordsworth - The Poetical Works of Henry Wordsworth Longfellow
# http://www.gutenberg.org/files/1365/1365.txt
# Coleridge's Ancient Mariner and Select Poems by Samuel Taylor Coleridge
# http://www.gutenberg.org/files/11101/11101.txt
# Poems of William Blake by William Blake
# http://www.gutenberg.org/files/574/574.txt
# Poems by Emily Dickinson, Three Series, Complete by Emily Dickinson
# http://www.gutenberg.org/files/12242/12242.txt

function(input, output, session) {
        # Define a reactive expression for the document term matrix
        terms <- reactive({
                # Change when the "update" button is pressed...
                input$update
                # ...but not for anything else
                isolate({
                        withProgress({
                                setProgress(message = "Processing corpus...")
                                getTermMatrix(input$selection)
                        })
                })
        })
        
        # Make the wordcloud drawing predictable during a session
        wordcloud_rep <- repeatable(wordcloud)
        
        output$plot <- renderPlot({
                v <- terms()
                wordcloud_rep(names(v), v, scale=c(4,0.5),
                              min.freq = input$freq, max.words=input$max,
                              colors=brewer.pal(8, "Dark2"))
        })
}
