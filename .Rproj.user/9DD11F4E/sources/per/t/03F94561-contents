## get important libraries once and for all

library(dplyr)
library(readr)
library('ruODK')
library('data.table')
library(lubridate)
library(stringr)

## ---------------- Global Variables ---------------- 
emisAndDist <- c(
  "unique_school_code",
  "district"
)


## ---------------- UTILITY FUNCTIONS ---------------- 
## functions to combine school level roster data with entry level roster data

## ---------------- STUDENT ROSTER ---------------- 
combineRosters <- function(schoolDat, studList){
  schLevelCols <- c(
    "group_school_code_1",
    "school_infor_school_name",
    "school_infor_district",
    "school_infor_tehsil",
    "id",
    "class"
  )
  
  schLevelColsReName <- c(
    "emis",
    "school_name",
    "district",
    "tehsil",
    "id",
    "class"
  )
  
  schoolDatRel <- schoolDat[, schLevelCols]
  names(schoolDatRel) <- schLevelColsReName
  
  studListSchData <- studList %>% left_join(
    schoolDatRel,
    by = c("submissions_id" = "id")
  )  
  
  return(studListSchData)
}

## ---------------- TEACHER ROSTER ---------------- 
combineTeachRosters <- function(schoolDat, teachList){
  schLevelCols <- c(
    "group_school_code_1",
    "school_infor_school_name",
    "school_infor_district",
    "school_infor_tehsil",
    "id"
  )
  
  schLevelColsReName <- c(
    "emis",
    "school_name",
    "district",
    "tehsil",
    "id"
  )
  
  schoolDatRel <- schoolDat[, schLevelCols]
  names(schoolDatRel) <- schLevelColsReName
  
  teachListSchData <- teachList %>% left_join(
    schoolDatRel,
    by = c("submissions_id" = "id")
  )  
  
  return(teachListSchData)
}

## ---------------- REPLACE AND RENAME FUNCTION (PRE-PROC) ---------------- 
replaceAndRel <- function(varsDict, relVars, dataset){
  newColNames <- varsDict$new_col_names
  oldColNames <- varsDict$old_col_names
  
  dataset1 <- dataset
  setnames(dataset1, old = oldColNames , new = newColNames)
  datasetRel <- dataset1[, relVars]
  return(datasetRel)
}


## ---------------- UNLIST AND WRITE ---------------- 
unlinkAndWrite <- function(link, dataset){
  unlink(link)
  write.csv(
    dataset, 
    link, 
    row.names = F, na=""
  )
}

## ---------------- FORMATTED YEAR ---------------- 
Yr <- function(text){
  return(as.POSIXct(as.character(text), format = "%Y"))
}

## ---------------- REPLACE NA WITH STH ---------------- 
replaceNA <- function(vect, replacement) {
  tempVect <- vect
  tempVect[is.na(vect)] <- replacement
  return(tempVect)
}


getSplitElem <- function(strVector, splitString, index){
  splitList <- str_split(strVector, splitString)
  return(
    unlist(
      lapply(
        splitList, 
        function(x) return(x[index])
      )
    )
  )
}

## ---------------- PROP CALCULATOR FUNC - USED IN SUMMARISE ---------------- 
propCalc <- function(vect, correctArr, denom){
  return(round((sum(vect %in% correctArr, na.rm = T)/denom) * 100, 1))
}

