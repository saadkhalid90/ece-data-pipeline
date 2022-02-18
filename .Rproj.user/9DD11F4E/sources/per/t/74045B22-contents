daFiles <- list.files(path = 'ece-dash/Data/DA/')
joinFiles <- list.files(path = 'ece-dash/Data/join-issues/')

# Remove original files
file.remove(from = paste0("pmiu-dash/Data/DA/",daFiles))

file.copy(
  from = paste0("ece-dash/Data/DA/", daFiles),
  to = paste0("pmiu-dash/Data/DA/", daFiles)
)

file.remove(from = "pmiu-dash/Data/summ.csv")

file.copy(
  from = "ece-dash/Data/summ.csv",
  to = "pmiu-dash/Data/summ.csv"
)

file.remove(from = "pmiu-dash/timeUpdated.RDS")

file.copy(
  from = "ece-dash/timeUpdated.RDS",
  to = "pmiu-dash/timeUpdated.RDS"
)

## Remove original files
file.remove(from = paste0("pmiu-dash/Data/join-issues/",joinFiles))

file.copy(
  from = paste0("ece-dash/Data/join-issues/", joinFiles),
  to = paste0("pmiu-dash/Data/join-issues/", joinFiles)
)
