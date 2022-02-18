enrolCols <- c(
  "c1a",
  "c2a",
  "c3a",
  "c1b",
  "c2b",
  "c3b",
  "c1c",
  "c2c",
  "c3c"
)

enrolColsRenam <- c(
  "unique_school_code",
  "SI_ECE_n_sections",
  "SI_ECE_boys",
  "SI_ECE_girls",
  "SI_katchi_n_sections",
  "SI_katchi_boys",
  "SI_katchi_girls",
  "SI_grade1_n_sections",
  "SI_grade1_boys",
  "SI_grade1_girls"
)

numeric_cols <- c(
  "SI_ECE_boys",
  "SI_ECE_girls",
  "SI_katchi_boys",
  "SI_katchi_girls",
  "SI_grade1_boys",
  "SI_grade1_girls"
)

schoolInfoEnrol <- schoolInfo[, c("unique_school_code", enrolCols)]
names(schoolInfoEnrol) <- enrolColsRenam

schoolInfoEnrol[numeric_cols] <- lapply(schoolInfoEnrol[numeric_cols], as.numeric)

## adding new columns
schoolInfoEnrol$SI_ECE <- schoolInfoEnrol$SI_ECE_boys + schoolInfoEnrol$SI_ECE_girls
schoolInfoEnrol$SI_katchi <- schoolInfoEnrol$SI_katchi_boys + schoolInfoEnrol$SI_katchi_girls
schoolInfoEnrol$SI_grade1 <- schoolInfoEnrol$SI_grade1_boys + schoolInfoEnrol$SI_grade1_girls


schoolEnrolCompare <- schoolInfoEnrol %>% 
  left_join(summ, c("unique_school_code" = "unique_school_code")) %>%
  select(c(
      "unique_school_code",
      "district",
      "date",
      "SI_ECE_n_sections",
      "SI_ECE_boys",
      "n_ECE_boys",
      "SI_ECE_girls",
      "n_ECE_girls",
      "SI_ECE",
      "n_ECE",
      "SI_katchi_n_sections",
      "SI_katchi_boys",
      "n_katchi_boys",
      "SI_katchi_girls",
      "n_katchi_girls",
      "SI_katchi",
      "n_katchi",
      "SI_grade1_n_sections",
      "SI_grade1_boys",
      "n_grade1_boys",
      "SI_grade1_girls",
      "n_grade1_girls",
      "SI_grade1",
      "n_grade1",
      "supervisor",
      "contact"
    )
  )

numeric_cols_1 <- c(
  "SI_ECE_n_sections",   
  "SI_ECE_boys",
  "n_ECE_boys",
  "SI_ECE_girls",
  "n_ECE_girls",
  "SI_ECE",
  "n_ECE",
  "SI_katchi_n_sections",
  "SI_katchi_boys",
  "n_katchi_boys",
  "SI_katchi_girls",
  "n_katchi_girls",
  "SI_katchi",
  "n_katchi",
  "SI_grade1_n_sections",
  "SI_grade1_boys",
  "n_grade1_boys",
  "SI_grade1_girls",
  "n_grade1_girls",
  "SI_grade1",
  "n_grade1"
)

## converting all enrolment data to numeric and replacing NAs with 0s
schoolEnrolCompare[numeric_cols_1] <- data.frame(lapply(schoolEnrolCompare[numeric_cols_1], as.numeric))
schoolEnrolCompare[is.na(schoolEnrolCompare)] <- 0

schoolEnrolCompare$unique_school_code <- as.character(schoolEnrolCompare$unique_school_code) 
schoolEnrolCompareLog1 <- ((schoolEnrolCompare$SI_ECE_n_sections == 0 & schoolEnrolCompare$n_ECE != 0) | 
  (schoolEnrolCompare$SI_ECE_n_sections != 0 & schoolEnrolCompare$n_ECE == 0)) |
  ((schoolEnrolCompare$SI_katchi_n_sections == 0 & schoolEnrolCompare$n_katchi != 0) | 
  (schoolEnrolCompare$SI_katchi_n_sections != 0 & schoolEnrolCompare$n_katchi == 0)) |
  ((schoolEnrolCompare$SI_grade1_n_sections == 0 & schoolEnrolCompare$n_grade1 != 0) | 
  (schoolEnrolCompare$SI_grade1_n_sections != 0 & schoolEnrolCompare$n_grade1 == 0))


schoolEnrolCompareLog2 <-
(schoolEnrolCompare$SI_ECE_n_sections == 1 & 
  (schoolEnrolCompare$SI_ECE_boys + schoolEnrolCompare$SI_ECE_girls != schoolEnrolCompare$n_ECE)) |
(schoolEnrolCompare$SI_katchi_n_sections == 1 & 
    (schoolEnrolCompare$SI_katchi_boys + schoolEnrolCompare$SI_katchi_girls != schoolEnrolCompare$n_katchi)) |
(schoolEnrolCompare$SI_grade1_n_sections == 1 & 
    (schoolEnrolCompare$SI_grade1_boys + schoolEnrolCompare$SI_grade1_girls != schoolEnrolCompare$n_grade1))

schoolEnrolCompareLog3 <-
  (schoolEnrolCompare$SI_ECE_n_sections > 1 & 
     (schoolEnrolCompare$SI_ECE_boys + schoolEnrolCompare$SI_ECE_girls != schoolEnrolCompare$n_ECE)) |
  (schoolEnrolCompare$SI_katchi_n_sections > 1 & 
     (schoolEnrolCompare$SI_katchi_boys + schoolEnrolCompare$SI_katchi_girls != schoolEnrolCompare$n_katchi)) |
  (schoolEnrolCompare$SI_grade1_n_sections > 1 & 
     (schoolEnrolCompare$SI_grade1_boys + schoolEnrolCompare$SI_grade1_girls != schoolEnrolCompare$n_grade1))

schoolEnrolCompare1 <- schoolEnrolCompare[schoolEnrolCompareLog1, ]
schoolEnrolCompare2 <- schoolEnrolCompare[schoolEnrolCompareLog2, ]
schoolEnrolCompare3 <- schoolEnrolCompare[schoolEnrolCompareLog3, ]

unlinkAndWrite('ece-dash/Data/schoolEnrolCompare1.csv', schoolEnrolCompare1)
unlinkAndWrite('ece-dash/Data/schoolEnrolCompare2.csv', schoolEnrolCompare2)
unlinkAndWrite('ece-dash/Data/schoolEnrolCompare3.csv', schoolEnrolCompare3)

combinedClass <- data.frame(
  unique_school_code = schoolInfo_$unique_school_code,
  comb_classes = paste(
    replaceNA(schoolInfo_$c7_1, ""), 
    replaceNA(schoolInfo_$c7_2, ""), 
    replaceNA(schoolInfo_$c7_3, "")
  )
)

combinedClass$ECE_combined <- grepl(pattern = "7", combinedClass$comb_classes)
combinedClass$katchi_combined <- grepl(pattern = "0", combinedClass$comb_classes)
combinedClass$grade1_combined <- grepl(pattern = "1", combinedClass$comb_classes)

combClassRostComp <- combinedClass %>% 
  left_join(
    summ[, c('unique_school_code', 'district', 'date', 'n_ECE', 'n_katchi', 'n_grade1', 'supervisor', 'contact')], 
    c('unique_school_code' = 'unique_school_code'))  

combClassRostComp$in_comb_not_roster <- trimws(
  paste(
    ifelse(combClassRostComp$ECE_combined & (combClassRostComp$n_ECE == 0 | is.na(combClassRostComp$n_ECE)), "ECE", ""),
    ifelse(combClassRostComp$katchi_combined & (combClassRostComp$n_katchi == 0 | is.na(combClassRostComp$n_katchi == 0)), "Katchi", ""),
    ifelse(combClassRostComp$grade1_combined & (combClassRostComp$n_grade1 == 0 | is.na(combClassRostComp$n_grade1 == 0)), "Grade1", "")
  )
)

combClassRostCompFilt <- combClassRostComp %>% 
  filter(in_comb_not_roster != "") %>% 
  select(unique_school_code, district, date, in_comb_not_roster, supervisor, contact)

unlinkAndWrite(
  'ece-dash/Data/combClassRostCompFilt.csv',
  combClassRostCompFilt
)

##schoolInfo_$a7_year <- format(as.POSIXct(schoolInfo_$a7_year), format = "%Y")

startYear = as.POSIXct("1950", format = "%Y")
endYear = as.POSIXct("2020", format = "%Y")

weirdYOE<- !(is.na(schoolInfo_$a7_year)) & (as.POSIXct(schoolInfo_$a7_year, format = "%Y") < startYear | as.POSIXct(schoolInfo_$a7_year, format = "%Y") > endYear)

weirdYOEDF <- schoolInfo_[weirdYOE, c("unique_school_code", "district", "date", "a7_year", "supervisor", "contact")]

unlinkAndWrite(
  'ece-dash/Data/weirdYOEDF.csv',
  weirdYOEDF
)

## Odd/ Extreme number of bathrooms
extBathCutoff <- 5
bathLog <- as.numeric(schoolInfo_$b2) > extBathCutoff

weirdBath <- schoolInfo_[bathLog, c(emisAndDist, "date", "b2", "supervisor", "contact")]
names(weirdBath) <- c(emisAndDist, "date", "n_bath", "supervisor", "contact")

unlinkAndWrite(
  'ece-dash/Data/weirdBath.csv',
  weirdBath
)
