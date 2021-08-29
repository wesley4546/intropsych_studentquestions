library(tidytext)
library(dplyr)
library(wordcloud)
library(stringr)


student_questions_df <- 
  readr::read_csv("psych_1_questions.csv") |> 
  mutate(question_number = row_number())


tokens <- student_questions_df |> 
  unnest_tokens(word, student_question) |> 
  anti_join(stop_words)

tokens <-
  tokens|> 
  mutate(word = gsub("psychological","psychology", word))

wordcloud(tokens$word, min.freq = 1, max.words = 100, rot.per=0.35,
          colors = brewer.pal(8, "Dark2"),
          random.order = FALSE)
