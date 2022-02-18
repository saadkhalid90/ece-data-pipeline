
ageChild <- round(
  time_length(
    difftime(
      Sys.Date(), 
      Yr(parent_$q5)), 
    "years"
  ), 0  
)

## age child checks
ageChildLog <- ageChild < 4 | ageChild > 7
ageChildCheck <- parent_[ageChildLog, c("unique_school_code", "district", "q5")]
ageChildCheck$age_child <- ageChild[ageChildLog]
names(ageChildCheck) <- c("unique_school_code", "district", "child_DOB", "age_child")

ageChildCheck <- ageChildCheck%>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

unlinkAndWrite(
  'ece-dash/Data/ageChildCheck.csv',
  ageChildCheck
)

## care giving checks
careGivingHoursLog <- parent_$q72 >= 10

careGiveCheck <- parent_[careGivingHoursLog, c("unique_school_code", "district", "q72")]
names(careGiveCheck) <- c("unique_school_code", "district", "hours_daily_care")

careGiveCheck <- careGiveCheck %>% 
  left_join(
    summ[, c('unique_school_code', 'date', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code')
  ) %>%
  select(unique_school_code, district, date, everything())

unlinkAndWrite(
  'ece-dash/Data/careGiveCheck.csv',
  careGiveCheck
)

 