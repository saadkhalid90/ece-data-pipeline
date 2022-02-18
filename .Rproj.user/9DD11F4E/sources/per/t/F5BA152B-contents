preProc <- function(type, dataset){
  vars <- read_csv(paste0('var-dict/', type, 'Vars.csv'))
  varsRel <- read_csv(paste0('var-dict/', type, 'VarsRel.csv'))$relObsCols
  rel <- replaceAndRel(vars, varsRel, dataset)
  rel$supervisor <- getSplitElem(rel$system_submitter_name, "-", 3) 
  rel$contact <- getSplitElem(rel$system_submitter_name, "-", 4) 
  rel$date <- as.Date(rel$start_time)
  return(rel)
}

DA_ <- preProc('DA', DA)
observation_ <- preProc('obs', observation)
parent_ <- preProc('parent', parent)
principal_ <- preProc('princ', principal)
teacher_ <- preProc('teacher', teacher)
schoolInfo_ <- preProc('schoolInfo', schoolInfo)




