library(tm)
library(wordcloud)
library(memoise)

# The list of valid poets
poets <<- list("Henry Wordsworth Longfellow" = "longfellow",
               "William Blake" = "blake",
               "Samuel Taylor Coleridge" = "coleridge",
               "Emily Dickinson" = "dickinson"
               )
# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(poet) {
        # Careful not to let just any name slip in here; a
        # malicious user could manipulate this value.
        if (!(poet %in% poets))
                stop("Unknown poem")
        
        text <- readLines(sprintf("./%s.txt.gz", poet),
                          encoding="UTF-8")
        
        myCorpus = Corpus(VectorSource(text))
        myCorpus = tm_map(myCorpus, content_transformer(tolower))
        myCorpus = tm_map(myCorpus, removePunctuation)
        myCorpus = tm_map(myCorpus, removeNumbers)
        myCorpus = tm_map(myCorpus, removeWords,
                          c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but", "sidenote"))
        
        myDTM = TermDocumentMatrix(myCorpus,
                                   control = list(minWordLength = 1))
        
        m = as.matrix(myDTM)
        
        sort(rowSums(m), decreasing = TRUE)
})