## formatting years datetime as just years
## teacher_$a2 <- format(as.POSIXct(teacher_$a2), format = "%Y")
## teacher_$a3 <- format(as.POSIXct(teacher_$a3), format = "%Y")
## teacher_$a4 <- format(as.POSIXct(teacher_$a4), format = "%Y")

teachNamePhone <- teacher_ %>% select(unique_school_code, teacher_name, teacher_phone)

durationAppointed <- round(
  time_length(
    difftime(
      Sys.Date(), 
      Yr(teacher_$a3)), 
    "years"
  ), 0  
)

durationTeaching <- round(
  time_length(
    difftime(
      Sys.Date(),
      Yr(teacher_$a2)), 
    "years"
  ), 0
)

durationThisSchool <- round(
  time_length(
    difftime(
      Sys.Date(),
      Yr(teacher_$a4)), 
    "years"
  ), 0
)


teachECELog <- replaceNA(durationThisSchool - teacher$a7 < 0, FALSE)

ageAppointed <- teacher_$a9 - durationAppointed
ageStartedTeaching <- teacher_$a9 - durationTeaching

extremeAgesLog <- 
  (ageStartedTeaching < 20 | ageStartedTeaching >= 30) |
  (ageAppointed < 20 | ageAppointed >= 30)

teachYearLog <- ((Yr(teacher_$a2) > Yr(teacher_$a3))) | 
  ((Yr(teacher_$a3) > Yr(teacher_$a4))) | 
  extremeAgesLog |
  teachECELog
  
teachYearLog <- replaceNA(teachYearLog, FALSE)

teachYearChecks <- teacher_[teachYearLog, c("unique_school_code", "district", "a9", "a2", "a3", "a4", "a7")]
names(teachYearChecks) <- c("unique_school_code", "district", "age", "year_start_teach", "year_appoint_govt", "year_curr_school", "dur_teaching_ECE")

teachYearChecks$age_start_teach <- ageStartedTeaching[teachYearLog]
teachYearChecks$age_appoint_govt <- ageAppointed[teachYearLog]
teachYearChecks$dur_this_school <- durationThisSchool[teachYearLog]

teachYearChecks <- teachYearChecks %>% select(
  c(
    "unique_school_code", 
    "district", 
    "age", 
    "year_start_teach", 
    "year_appoint_govt", 
    "year_curr_school", 
    "dur_teaching_ECE",
    "dur_this_school",
    "age_start_teach",
    "age_appoint_govt")
)

teachYearChecks <- teachYearChecks %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

teachYearChecks$teacher_name <- teachNamePhone$teacher_name[teachYearLog]
teachYearChecks$teacher_phone <- teachNamePhone$teacher_phone[teachYearLog]

unlinkAndWrite(
  'ece-dash/Data/teachYearChecks.csv',
  teachYearChecks
)

## Marriage - age - comparisons
durationMarried <- round(
  time_length(
    difftime(
      Sys.Date(), 
      Yr(teacher_$a18)
    ), 
    "years"
  ), 0  
)

ageWhenMarried <- teacher_$a9 - durationMarried
marriedIssueLog <- ageWhenMarried >= 35 | ageWhenMarried <= 18
marriedIssueLog <- replaceNA(marriedIssueLog, FALSE) 

marriageChecks <- teacher_[marriedIssueLog, c("unique_school_code", "district", "a9", "a18")]
names(marriageChecks) <- c("unique_school_code", "district", "age", "year_married")
marriageChecks$age_married <- ageWhenMarried[marriedIssueLog]

marriageChecks <- marriageChecks %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

marriageChecks$teacher_name <- teachNamePhone$teacher_name[marriedIssueLog]
marriageChecks$teacher_phone <- teachNamePhone$teacher_phone[marriedIssueLog]

unlinkAndWrite(
  'ece-dash/Data/marriageChecks.csv',
  marriageChecks
)

## ECE Katchi Incons

teachECEKatchiCheck <- teacher_[, c("unique_school_code", "a6")] %>%
  left_join(
    schoolEnrolCompare %>% select(
      unique_school_code,
      SI_ECE_n_sections,
      SI_katchi_n_sections,
      n_ECE,
      n_katchi
    ),
    by = c("unique_school_code" = "unique_school_code")
  )

teachECEKatchiCheck$a6 <- gsub("0", "None", teachECEKatchiCheck$a6)
teachECEKatchiCheck$a6 <- gsub("1", "ECE", teachECEKatchiCheck$a6)
teachECEKatchiCheck$a6 <- gsub("2", "Katchi", teachECEKatchiCheck$a6)

names(teachECEKatchiCheck) <- c(
  "unique_school_code",
  "teach_ECE_Katchi",
  "SI_ECE_n_sections",
  "SI_katchi_n_sections",
  "n_ECE",
  "n_katchi" 
)

teachECEKatchiLog <- (grepl("ECE", teachECEKatchiCheck$teach_ECE_Katchi) & 
     (teachECEKatchiCheck$SI_ECE_n_sections == 0 | teachECEKatchiCheck$n_ECE == 0)) |
  (grepl("Katchi", teachECEKatchiCheck$teach_ECE_Katchi) & 
     (teachECEKatchiCheck$SI_katchi_n_sections == 0) | (teachECEKatchiCheck$n_katchi == 0))

teachECEKatchiLog <- replaceNA(teachECEKatchiLog, FALSE)
teachECEKatchiCheck <- teachECEKatchiCheck[teachECEKatchiLog, ]

teachECEKatchiCheck <- teachECEKatchiCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'district', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

teachECEKatchiCheck$teacher_name <- teachNamePhone$teacher_name[teachECEKatchiLog]
teachECEKatchiCheck$teacher_phone <- teachNamePhone$teacher_phone[teachECEKatchiLog]

unlinkAndWrite(
  'ece-dash/Data/teachECEKatchiCheck.csv',
  teachECEKatchiCheck
)

## Too many classes

classCutoff <- 5
nClasses <- (nchar(teacher_$a6a) + 1)/2
tooManyClassesLog <- nClasses >= classCutoff
tooManyClassesCheck <- teacher_[tooManyClassesLog, c("unique_school_code", "district", "a6a")]
tooManyClassesCheck$nClasses <- nClasses[tooManyClassesLog]

tooManyClassesCheck <- tooManyClassesCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

tooManyClassesCheck$teacher_name <- teachNamePhone$teacher_name[tooManyClassesLog]
tooManyClassesCheck$teacher_phone <- teachNamePhone$teacher_phone[tooManyClassesLog]

unlinkAndWrite(
  'ece-dash/Data/tooManyClasses.csv',
  tooManyClassesCheck
)

## Monthly family vs personal income
familPersonIncomeLog <- teacher_$a25 != 99 & teacher_$a25 < teacher_$b2
familPersonIncomeCheck <- teacher_[familPersonIncomeLog, c("unique_school_code", "district", "a25", "b2")]
names(familPersonIncomeCheck) <- c("unique_school_code", "district", "family_income", "net_salary")

familPersonIncomeCheck <- familPersonIncomeCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

familPersonIncomeCheck$teacher_name <- teachNamePhone$teacher_name[familPersonIncomeLog]
familPersonIncomeCheck$teacher_phone <- teachNamePhone$teacher_phone[familPersonIncomeLog]

unlinkAndWrite(
  'ece-dash/Data/familPersonIncomeCheck.csv',
  familPersonIncomeCheck
)


## tuition start - teaching start
tuitTeachStartLog <- teacher_$b13a < teacher_$a2
tuitTeachStartLog <- replaceNA(tuitTeachStartLog, FALSE)

tuitTeachStartCheck <- teacher_[tuitTeachStartLog, c("unique_school_code", "district", "a2", "b13a")]
names(tuitTeachStartCheck) <- c("unique_school_code", "district", "year_start_teach", "year_start_tuition")

tuitTeachStartCheck <- tuitTeachStartCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

tuitTeachStartCheck$teacher_name <- teachNamePhone$teacher_name[tuitTeachStartLog]
tuitTeachStartCheck$teacher_phone <- teachNamePhone$teacher_phone[tuitTeachStartLog]

unlinkAndWrite(
  'ece-dash/Data/tuitTeachStartCheck.csv',
  tuitTeachStartCheck
)

## ECE Training Roster Comparison
ECETrainLog <- teacher_$c8 == "4" | teacher_$c8 == "5"
schoolEnrolCompare$unique_school_code <- as.character(schoolEnrolCompare$unique_school_code)
ECETrainRostComp <- teacher_[ECETrainLog, c("unique_school_code", "district")] %>%
  left_join(
    schoolEnrolCompare %>% select(
      unique_school_code,
      SI_ECE_n_sections,
      n_ECE
    ),
    by = c("unique_school_code" = "unique_school_code")
  )

teachNamePhone_ <- teachNamePhone[ECETrainLog, ]

ECETrainLog_ <- (ECETrainRostComp$SI_ECE_n_sections == 0 | ECETrainRostComp$n_ECE == 0)

ECETrainLog_ <- replaceNA(ECETrainLog_, FALSE)

ECETrainRostComp <- ECETrainRostComp %>% filter(SI_ECE_n_sections == 0 | n_ECE == 0)

ECETrainRostComp <- ECETrainRostComp %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

ECETrainRostComp$teacher_name <- teachNamePhone_$teacher_name[ECETrainLog_]
ECETrainRostComp$teacher_phone <- teachNamePhone_$teacher_phone[ECETrainLog_]

teachNamePhone_$teacher_name[ECETrainLog_]


unlinkAndWrite(
  'ece-dash/Data/ECETrainRostComp.csv',
  ECETrainRostComp
)

## teaching and other activity time check
propTeach <- teacher_$d3/teacher_$d2
propOther <- teacher_$d4/teacher_$d3

propTotal <- propTeach + propOther

teachTimeLog <- propTotal > 1 | propTeach > 0.7 | teacher_$d2 > 6
teachTimeCheck  <- teacher_[teachTimeLog, c("unique_school_code", "district", "d2", "d3", "d4")]
names(teachTimeCheck) <- c("unique_school_code", "district", "time_school", "time_teach", "time_other")

teachTimeCheck <- teachTimeCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

teachTimeCheck$teacher_name <- teachNamePhone$teacher_name[teachTimeLog]
teachTimeCheck$teacher_phone <- teachNamePhone$teacher_phone[teachTimeLog]

unlinkAndWrite(
  'ece-dash/Data/teachTimeCheck.csv',
  teachTimeCheck
)

## failed and returned checks
failedProp <- teacher_$e6/ teacher_$e5
returnedProp <- teacher_$e6a/ teacher_$e5

failRetLog <- failedProp > 0.2 | returnedProp < 0.6
failRetCheck <- teacher_[failRetLog, c("unique_school_code", "district", "e5", "e6", "e6a")]
names(failRetCheck) <- c("unique_school_code", "district", "stud_enroll_2020", "failed_stud", "returned_stud")

failRetCheck <- failRetCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

failRetCheck$teacher_name <- teachNamePhone$teacher_name[failRetLog]
failRetCheck$teacher_phone <- teachNamePhone$teacher_phone[failRetLog]

unlinkAndWrite(
  'ece-dash/Data/failRetCheck.csv',
  failRetCheck
)

