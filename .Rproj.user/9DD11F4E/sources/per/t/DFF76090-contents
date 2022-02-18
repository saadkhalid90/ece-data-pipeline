## Listening Comprehension
questionVectGen <- function(questionNo, letterVect){
  return(paste0(questionNo, letterVect))
}


DA_prop_summ <- function(masterDAData, varVect, correctVect){
  summ_dist <- masterDAData %>%
    group_by(district) %>%
    summarise(across(varVect, ~ propCalc(.x, correctVect, n())))
  
  names(summ_dist) <- c("area", varVect)
  
  summ_punj <- masterDAData %>%
    summarise(across(varVect, ~ propCalc(.x, correctVect, n())))
  
  summ_punj$area <- "Punjab"
  summ_punj %>% select(c("area", varVect))
  
  return(rbind(summ_dist, summ_punj))
}

lit_1_summ <- DA_prop_summ(DA_, questionVectGen("q1", letters[1:5]), c(1))
lit_2_summ <- DA_prop_summ(DA_, questionVectGen("q2", letters[1:20]), c(1))
lit_3_summ <- DA_prop_summ(DA_, questionVectGen("q3", letters[1:3]), c(1))
lit_4_summ <- DA_prop_summ(DA_, questionVectGen("qe2", letters[1:20]), c(1))


lit_5_summ_ <- DA_ %>% 
  group_by(district) %>% 
  summarise(
    level0 = round((sum(q4a == 0, na.rm = T)/n()) * 100, 1),
    level1 = round((sum(q4a == 1, na.rm = T)/n()) * 100, 1),
    level2 = round((sum(q4a == 2, na.rm = T)/n()) * 100, 1),
    level3 = round((sum(q4a == 3, na.rm = T)/n()) * 100, 1),
    level4 = round((sum(q4a == 4, na.rm = T)/n()) * 100, 1)
  )

names(lit_5_summ_) <- c("area", questionVectGen("level", 0:4))

lit_5_punj <- DA_ %>% 
  summarise(
    level0 = round((sum(q4a == 0, na.rm = T)/n()) * 100, 1),
    level1 = round((sum(q4a == 1, na.rm = T)/n()) * 100, 1),
    level2 = round((sum(q4a == 2, na.rm = T)/n()) * 100, 1),
    level3 = round((sum(q4a == 3, na.rm = T)/n()) * 100, 1),
    level4 = round((sum(q4a == 4, na.rm = T)/n()) * 100, 1)
  )

lit_5_punj$area <- "Punjab"
lit_5_punj <- lit_5_punj %>% select(c("area", questionVectGen("level", 0:4)))

lit_5_summ <- rbind(lit_5_summ_, lit_5_punj)


num_1_summ <- DA_prop_summ(DA_, questionVectGen("q5", letters[1:4]), c(1))
num_2_summ <- DA_prop_summ(DA_, questionVectGen("q6", letters[1:4]), c(1))
num_3_summ <- DA_prop_summ(DA_, questionVectGen("q7", letters[1:3]), c(1))
num_4_summ <- DA_prop_summ(DA_, questionVectGen("q8", letters[1:20]), c(1, 2))
num_5_summ <- DA_prop_summ(DA_, questionVectGen("q9", letters[1:3]), c(1, 2))
num_6_summ <- DA_prop_summ(DA_, questionVectGen("q10", letters[1:5]), c(1))

exf_1_summ <- DA_prop_summ(DA_, questionVectGen("q11", letters[1:15]), c(1,2))
exf_2_summ <- DA_prop_summ(DA_, questionVectGen("q12", letters[1:4]), c(1))
exf_3_summ <- DA_prop_summ(DA_, questionVectGen("q13", letters[1:4]), c(1))

soc_1_summ <- DA_prop_summ(DA_, questionVectGen("q14", letters[1:3]), c(1))

unlinkAndWrite(
  'ece-dash/Data/DA/lit_1_summ.csv',
  lit_1_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/lit_2_summ.csv',
  lit_2_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/lit_3_summ.csv',
  lit_3_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/lit_4_summ.csv',
  lit_4_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/lit_5_summ.csv',
  lit_5_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/num_1_summ.csv',
  num_1_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/num_2_summ.csv',
  num_2_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/num_3_summ.csv',
  num_3_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/num_4_summ.csv',
  num_4_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/num_5_summ.csv',
  num_5_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/num_6_summ.csv',
  num_6_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/exf_1_summ.csv',
  exf_1_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/exf_2_summ.csv',
  exf_2_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/exf_3_summ.csv',
  exf_3_summ
)

unlinkAndWrite(
  'ece-dash/Data/DA/soc_1_summ.csv',
  soc_1_summ
)
