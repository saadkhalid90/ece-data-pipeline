## read in the required libraries

library(shiny)
library(DT)
library(formattable)
library(readr)

questionVectGen <- function(questionNo, letterVect){
  return(paste0(questionNo, letterVect))
}

## read in the required data
summ <- read_csv('Data/summ.csv')

timeUpdated <- readRDS('timeUpdated.RDS')

# DA data
lit_1_summ <- read_csv('Data/DA/lit_1_summ.csv')
lit_2_summ <- read_csv('Data/DA/lit_2_summ.csv')
lit_3_summ <- read_csv('Data/DA/lit_3_summ.csv')
lit_4_summ <- read_csv('Data/DA/lit_4_summ.csv')
lit_5_summ <- read_csv('Data/DA/lit_5_summ.csv')

num_1_summ <- read_csv('Data/DA/num_1_summ.csv')
num_2_summ <- read_csv('Data/DA/num_2_summ.csv')
num_3_summ <- read_csv('Data/DA/num_3_summ.csv')
num_4_summ <- read_csv('Data/DA/num_4_summ.csv')
num_5_summ <- read_csv('Data/DA/num_5_summ.csv')
num_6_summ <- read_csv('Data/DA/num_6_summ.csv')

exf_1_summ <- read_csv('Data/DA/exf_1_summ.csv')
exf_2_summ <- read_csv('Data/DA/exf_2_summ.csv')
exf_3_summ <- read_csv('Data/DA/exf_3_summ.csv')

soc_1_summ <- read_csv('Data/DA/soc_1_summ.csv')

## obs da join problems
teach_code <- read_csv('Data/join-issues/teach_code.csv')

## format the data using formattable
formattedSumm <- formattable(
  summ, 
  list(
    n_obs = color_bar("#E3F2FD"),
    n_DA = color_bar("#E3F2FD"),
    n_teacherInt = color_bar("#E3F2FD"),
    n_teachRosters = color_bar("#E3F2FD")
  )
)

formatted_lit_1 <- formattable(
  lit_1_summ, 
  list(
    area(col = questionVectGen("q1", letters[1:5])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_lit_2 <- formattable(
  lit_2_summ, 
  list(
    area(col = questionVectGen("q2", letters[1:20])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_lit_3 <- formattable(
  lit_3_summ, 
  list(
    area(col = questionVectGen("q3", letters[1:3])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_lit_4 <- formattable(
  lit_4_summ, 
  list(
    area(col = questionVectGen("qe2", letters[1:20])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_lit_5 <- formattable(
  lit_5_summ, 
  list(
    area(col = questionVectGen("level", 0:4)) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_num_1 <- formattable(
  num_1_summ, 
  list(
    area(col = questionVectGen("q5", letters[1:4])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_num_2 <- formattable(
  num_2_summ, 
  list(
    area(col = questionVectGen("q6", letters[1:4])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_num_3 <- formattable(
  num_3_summ, 
  list(
    area(col = questionVectGen("q7", letters[1:3])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_num_4 <- formattable(
  num_4_summ, 
  list(
    area(col = questionVectGen("q8", letters[1:20])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_num_5 <- formattable(
  num_5_summ, 
  list(
    area(col = questionVectGen("q9", letters[1:3])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_num_6 <- formattable(
  num_6_summ, 
  list(
    area(col = questionVectGen("q10", letters[1:5])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_exf_1 <- formattable(
  exf_1_summ, 
  list(
    area(col = questionVectGen("q11", letters[1:15])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_exf_2 <- formattable(
  exf_2_summ, 
  list(
    area(col = questionVectGen("q12", letters[1:4])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_exf_3 <- formattable(
  exf_3_summ, 
  list(
    area(col = questionVectGen("q13", letters[1:4])) ~ color_tile("transparent", "#90CAF9")
  )
)

formatted_soc_1 <- formattable(
  soc_1_summ, 
  list(
    area(col = questionVectGen("q14", letters[1:3])) ~ color_tile("transparent", "#90CAF9")
  )
)

empty_formatter <- formatter(
  "span", 
  style = x ~ style (
    display = "block",
    `background-color` = ifelse(is.na(x), "#EF9A9A", "none")
  )
)

formatted_teach_code <- formattable(
  teach_code, 
  list(
    n_da = empty_formatter,
    n_obs = empty_formatter
  )
)
