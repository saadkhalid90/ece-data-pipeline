## ---------------- ruODK READ IN FUNCTION ---------------- 

readStartTime <- Sys.time()

readInODK <- function(svcLink, dataIndex, download){
   Sys.setenv(ODKC_URL="https://surveygat.site")
   Sys.setenv(ODKC_SVC=svcLink)
   Sys.setenv(ODKC_UN="gatuser1@gmail.com")
   Sys.setenv(ODKC_PW="gatuser1@")
   
   ruODK::ru_setup(
     svc = Sys.getenv("ODKC_SVC"), 
     un = Sys.getenv("ODKC_UN"), 
     pw = Sys.getenv("ODKC_PW"),
     tz = "Asia/Karachi",
     verbose = TRUE
   )
   
   fq_svc <- ruODK::odata_service_get()
   loc <- fs::path("media")
   
   fq_data <- ruODK::odata_submission_get(
     table = fq_svc$name[dataIndex], 
     local_dir = loc,
     wkt=TRUE,
     download = download)
   
   return(fq_data)
}

## 1 - Student Rosters
roster1 <- readInODK("https://surveygat.site/v1/projects/2/forms/1-ROSTER.svc", 1, F)
roster2 <- readInODK("https://surveygat.site/v1/projects/2/forms/1-ROSTER.svc", 2, F)
roster <- combineRosters(roster1, roster2)

## 2 - School Information
schoolInfo <- readInODK("https://surveygat.site/v1/projects/2/forms/2-School%20Information.svc", 1, F)

## 3 - Principal
principal <- readInODK("https://surveygat.site/v1/projects/2/forms/3-Principal.svc", 1, F)

## 4 - Direct Assessment
DA <- readInODK("https://surveygat.site/v1/projects/2/forms/4-Direct%20Assessment.svc", 1, F)

## 5 - Observation
observation <- readInODK("https://surveygat.site/v1/projects/2/forms/5-Observation.svc", 1, F)

## 6 - Teacher
teacher <- readInODK("https://surveygat.site/v1/projects/2/forms/6-Teacher.svc", 1, F)

## 7 - Parent
parent <- readInODK("https://surveygat.site/v1/projects/2/forms/7-Parent-Caregiver.svc", 1, F)

## 8 - Teacher Rosters
teachRoster1 <- readInODK("https://surveygat.site/v1/projects/2/forms/8-Teacher-Rosters.svc", 1, F)
teachRoster2 <- readInODK("https://surveygat.site/v1/projects/2/forms/8-Teacher-Rosters.svc", 2, F)
teachRoster <- combineTeachRosters(teachRoster1, teachRoster2)  


## ---------------- In case of any review logic (Uncomment)---------------- 

# roster <- roster %>% filter(is.na(system_review_state) | system_review_state != 'rejected')
# roster1 <- roster1 %>% filter(is.na(system_review_state) | system_review_state != 'rejected')
# teachRoster <- teachRoster %>% filter(is.na(system_review_state) | system_review_state != 'rejected')
# teachRoster1 <- teachRoster1 %>% filter(is.na(system_review_state) | system_review_state != 'rejected')
# observation <- observation %>% filter(is.na(system_review_state) | system_review_state != 'rejected')

principal <- principal %>% filter(is.na(system_review_state) | system_review_state != 'rejected')
schoolInfo <- schoolInfo %>% filter(is.na(system_review_state) | system_review_state != 'rejected')

timeUpdated <- format(Sys.time(), "%a %b %d  %Y %X")
saveRDS(object = timeUpdated, file = 'ece-dash/timeUpdated.RDS')

print(Sys.time() - readStartTime)
  