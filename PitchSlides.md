Word Cloud
========================================================
author: Benjamin Smith
date: March 18, 2018
autosize: TRUE

Introduction
========================================================

The application is located at 
<https://misterliver52.shinyapps.io/WordCloud2/>.
- Uses excerpted text from selected poets.
- Is based on user selection of individual poet.
- Allows user to choose minimum word frequency
- Allows user to choose maximum words displayed.

Data Sets
========================================================

The word cloud application is based on excerpts from selected 19th Century 
English-language poetic works by: 

- Henry Wordsworth Longfellow
- William Blake
- Samuel Taylor Coleridge
- Emily Dickinson

All the works were sourced from Project Gutenberg <https://www.gutenberg.org>,
and are referenced in the server.R file in the application.


Word Cloud Function
========================================================
The subject text is selected based on user selection and passed to a corpus,
trims common words (a, the, an, etc.), and places in a matrix.<small>

```r
library(tm);library(wordcloud);library(memoise)
#text <- readLines(sprintf("./%s.txt.gz", poet), encoding="UTF-8")
 text <- "The quick brown fox jumps over the lazy dog."       
myCorpus = Corpus(VectorSource(text))
myCorpus = tm_map(myCorpus, removeWords, c(stopwords("SMART"), "thy", "the"))
myDTM = TermDocumentMatrix(myCorpus,control = list(minWordLength = 1))
print(myDTM)
```

```
<<TermDocumentMatrix (terms: 7, documents: 1)>>
Non-/sparse entries: 7/0
Sparsity           : 0%
Maximal term length: 5
Weighting          : term frequency (tf)
```
</small>  
  
Word Cloud UI
========================================================
<div align="center">
<img src = "WordCloud.png" width=979 height=447>
</div>
***  
- Select author and click Change button
- Select Minimum Word Frequency
- Select Maximum Number of Words in cloud
