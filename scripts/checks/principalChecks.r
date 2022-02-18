
## formatting years datetime as just years
# principal_$a6 <- format(as.POSIXct(principal_$a6), format = "%Y")
# principal_$a7 <- format(as.POSIXct(principal_$a7), format = "%Y")
# principal_$a8 <- format(as.POSIXct(principal_$a8), format = "%Y")
# principal_$a11 <- format(as.POSIXct(principal_$a11), format = "%Y")

princNamePhone <- principal_ %>% select(unique_school_code, a1, phone)
names(princNamePhone) <- c("unique_school_code", "principal_name", "princ_phone")

ageAppointed <- round(
  time_length(
    difftime(
      Yr(principal_$a7), 
      Yr(principal_$a11)), 
    "years"
  ), 2  
)

ageStartedTeaching <- round(
  time_length(
    difftime(
      Yr(principal_$a6), 
      Yr(principal_$a11)), 
    "years"
  ), 2  
)

extremeAgesLog <- 
  (ageStartedTeaching < 20 | ageStartedTeaching >= 30) |
  (ageAppointed < 20 | ageAppointed >= 30)

princYearLog <- ((Yr(principal_$a6) > Yr(principal_$a7))) | ((Yr(principal_$a7) > Yr(principal_$a8))) | extremeAgesLog
princYearLog <- replaceNA(princYearLog, FALSE)


princYearChecks <- principal_[princYearLog, c("unique_school_code", "district", "a11", "a6", "a7", "a8")]
names(princYearChecks) <- c("unique_school_code", "district", "year_birth", "year_start_teach", "year_appoint_govt", "year_curr_school")

princYearChecks$ageStartTeach <- ageStartedTeaching[princYearLog]
princYearChecks$ageAppointGovt <- ageAppointed[princYearLog]

princYearChecks <- princYearChecks %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())
  
unlinkAndWrite(
  'ece-dash/Data/princYearChecks.csv',
  princYearChecks %>% left_join(princNamePhone, by = c("unique_school_code"))
)

## Salary checks
grossSal <- as.numeric(principal_$b1)
netSal <- as.numeric(principal_$b2)

dedPerc <- round((grossSal - netSal) * 100/grossSal, 2)

salaryLog <- (dedPerc == 0) | (dedPerc > 10) | grossSal > 80000
salaryChecks <- principal_[
  salaryLog, 
  c("unique_school_code", "district", "b1", "b2", "a7")
]

names(salaryChecks) <- c("unique_school_code", "district", "gross_salary", "net_salary", "year_apointed")
salaryChecks$ded_perc <- dedPerc[salaryLog]

salaryChecks <- salaryChecks %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

unlinkAndWrite(
  'ece-dash/Data/salaryChecks.csv',
  salaryChecks %>% left_join(princNamePhone, by = c("unique_school_code"))
)

## training main topics check
nTopics <- as.integer((nchar(principal_$c4) + 1)/2)
nTopicLog <- replaceNA(nTopics >= 3, FALSE)

nTopicChecks <- principal_[
  nTopicLog, 
  c("unique_school_code", "district")
]

nTopicChecks$n_topics <- nTopics[nTopicLog]

nTopicChecks <- nTopicChecks %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

unlinkAndWrite(
  'ece-dash/Data/nTrainTopics.csv',
  nTopicChecks %>% left_join(princNamePhone, by = c("unique_school_code"))
)

schoolEnrolCompare$unique_school_code <- as.character(schoolEnrolCompare$unique_school_code)

## Pre primary classes checks
prePrimChecks <- principal_[, c("unique_school_code", "district", "f1")] %>% 
  right_join(
    schoolEnrolCompare %>% 
      select(unique_school_code, SI_ECE_n_sections, SI_katchi_n_sections, n_ECE, n_katchi),
    by = c("unique_school_code" = "unique_school_code")  
  )

prePrimChecks$f1 <- gsub("0", "Katchi", prePrimChecks$f1)
prePrimChecks$f1 <- gsub("6", "ECE", prePrimChecks$f1)
prePrimChecks$f1 <- gsub("97", "Other", prePrimChecks$f1)
prePrimChecks$f1 <- gsub("99", "None", prePrimChecks$f1)

names(prePrimChecks) <- c(
  "unique_school_code",   
  "district",
  "pre_prim_grades",
  "SI_ECE_n_sections",
  "SI_katchi_n_sections",
  "n_ECE",
  "n_katchi"
)  

katchiProbLog <- (grepl("Katchi", prePrimChecks$pre_prim_grades) & prePrimChecks$SI_katchi_n_sections == 0) |
  (grepl("Katchi", prePrimChecks$pre_prim_grades) & prePrimChecks$n_katchi == 0)
  
ECEProbLog <- (grepl("ECE", prePrimChecks$pre_prim_grades) & prePrimChecks$SI_ECE_n_sections == 0) |
  (grepl("ECE", prePrimChecks$pre_prim_grades) & prePrimChecks$n_ECE == 0)

noneWithGradeLog <- grepl("None", prePrimChecks$pre_prim_grades) & (nchar(prePrimChecks$pre_prim_grades) > 4) 

katchiECEProbLog <- katchiProbLog | ECEProbLog | noneWithGradeLog

prePrimChecksFilt <- prePrimChecks[katchiECEProbLog, ]

prePrimChecksFilt <- prePrimChecksFilt %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

unlinkAndWrite(
  'ece-dash/Data/prePrimChecks.csv',
  prePrimChecksFilt %>% left_join(princNamePhone, by = c("unique_school_code"))
)
