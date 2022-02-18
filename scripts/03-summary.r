## ---------------- FUNCTION FOR REPORTING PROGRESS SUMMARY ---------------- 

createSummary <- function(){
  rosterSumm <- roster %>% 
    group_by(district, emis) %>% 
    summarise(
      n_ECE = sum(class == "ECE"),
      n_ECE_boys = sum(class == "ECE" & gender=="Male"),
      n_ECE_girls = sum(class == "ECE" & gender=="Female"),
      n_katchi = sum(class == "Katchi"),
      n_katchi_boys = sum(class == "Katchi" & gender=="Male"),
      n_katchi_girls = sum(class == "Katchi" & gender=="Female"),
      n_grade1 = sum(class == "Grade_1"),
      n_grade1_boys = sum(class == "Grade_1" & gender=="Male"),
      n_grade1_girls = sum(class == "Grade_1" & gender=="Female")
    ) 
  
  teachRosterSumm <- teachRoster %>% 
    group_by(district, emis) %>% 
    summarise(
      n_teachRosters = n()
    ) 
  
  rosterSubSumm <- roster1 %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_studentRosterSub = n()
    )
  
  teachRostSumm <- teachRoster1 %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_teachRost = n()
    )
  
  obsSumm <- observation %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_obs = n()
    )
  
  DASumm <- DA %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_DA = n()
    )
  
  teachSumm <- teacher %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_teacherInt = n()
    )
  
  principalSumm <- principal %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_principalInt = n()
    )
  
  parentSumm <- parent %>% 
    group_by(group_school_code_1, school_infor_district) %>%
    summarise(
      n_parent = n()
    )
  
  schoolInfoSumm <- schoolInfo %>% 
    group_by(
      group_school_code_1, 
      school_infor_district, 
      school_infor_school_name,
      system_submitter_name,
      startdate
    ) %>%
    summarise(
      n_schoolInfo = n()
    )
  
  summ <- schoolInfoSumm %>% 
    left_join(obsSumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(DASumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(parentSumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(teachSumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(principalSumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(teachRostSumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(
      teachRosterSumm, 
      by = c(
        "group_school_code_1" = "emis", 
        "school_infor_district" = "district"
      )
    ) %>%
    left_join(rosterSubSumm, by = c("group_school_code_1", "school_infor_district")) %>%
    left_join(
      rosterSumm, 
      by = c(
        "group_school_code_1" = "emis", 
        "school_infor_district" = "district"
      )
    )
  
  summ <- rename(summ, unique_school_code = group_school_code_1)
  summ <- rename(summ, date = startdate)
  summ <- rename(summ, district = school_infor_district)
  summ <- rename(summ, school_name = school_infor_school_name)
  
  summ$unique_school_code <- as.character(summ$unique_school_code)
  
  summ$supervisor <- getSplitElem(summ$system_submitter_name, "-", 3) 
  summ$contact <- getSplitElem(summ$system_submitter_name, "-", 4)
  summ$date <- as.Date(summ$date)
  summ$system_submitter_name <- NULL
  
  ## supervisors data
  
  summ[is.na(summ)] <- 0
  
  unlink("summary/summ.csv")
  write.csv(summ, 'summary/summ.csv', row.names = F, na="")  
  
  unlinkAndWrite(
    'ece-dash/Data/summ.csv',
    summ
  )
  return(summ)
}

## call the summary function
summ <- createSummary() 




