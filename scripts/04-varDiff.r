varsComp <- function(type, dataset){
  dictVars <- read_csv(paste0('var-dict/', type, 'Vars.csv'))$old_col_names
  
  dataCols <- names(dataset)
  nCols <- ncol(dataset)
  nDict <- length(dictVars)
  
  diff <- setdiff(dataCols, dictVars)
  
  return(
    data.frame(
      type = type,
      nCols = nCols,
      nDict = nDict,
      diff = paste(diff, collapse = " ")
    )
  )
}

VarDiffMatrix <- rbind(
  varsComp('obs', observation),
  varsComp('DA', DA),
  varsComp('teacher', teacher),
  varsComp('princ', principal),
  varsComp('schoolInfo', schoolInfo),
  varsComp('parent', parent)  
)
