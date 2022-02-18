##observation_$teacher_code <- 

observation_$teacher_code <- as.numeric(
  str_extract(observation_$teacher_code, "[1-5]")
)

DA_$teacher_code <- as.numeric(
  str_extract(DA_$teacher_code, "[1-5]")
)

obs_teach_code <- observation_ %>% 
  group_by(district, unique_school_code, teacher_code) %>%
  summarise(
    n_obs = n(),
    grades_obs = paste0(class, collapse = " | ")
  )

observation_$principal_class <- ""

not_comb_class <- is.na(observation_$class_teaching_this_time)
observation_$principal_class[not_comb_class] <- observation_$class[not_comb_class]
observation_$principal_class[!not_comb_class] <- observation_$class_teaching_this_time[!not_comb_class]
observation_$class


comp_obs_teach_code <- obs_teach_code %>% 
  filter(n_obs == 2)

observation__ <- comp_obs_teach_code %>%
  select(district, unique_school_code, teacher_code) %>%
  left_join(observation_, by = c(
    "unique_school_code", 
    "teacher_code"
    )
  )

observation__$district.x <- NULL
observation__ <- rename(observation__, district = district.y)

obd_dup_num <- dim(observation__)[1]

even_idx <- seq(0, obd_dup_num, 2)
odd_idx <- seq(1, obd_dup_num, 2)

matrix_cols <- c(
  "s1_e1_score",
  "s1_e2_score",
  "s1_e3_score",
  "s1_e4_score",
  "s1_e5_score",
  "s1_e6_score",
  "s1_e7_score",
  "s1_e8_score",
  "s1_e9_score",
  "s2_e1_score",
  "s2_e2_score",
  "s2_e3_score",
  "s2_e4_score",
  "s2_e5_score",
  "s2_e6_score",
  "s2_e7_score",
  "s2_e8_score",
  "s2_e9_score"
)

elem_score_matrix <- observation__[, matrix_cols]
elem_score_matrix <- data.frame(lapply(elem_score_matrix, as.numeric))

elem_score_diff <- abs(elem_score_matrix[odd_idx, ] - elem_score_matrix[even_idx, ])
elem_score_diff$district <- observation__$district[odd_idx]
elem_score_diff$unique_school_code <- observation__$unique_school_code[odd_idx]

elem_score_diff <- elem_score_diff %>% 
  select(
    c(
      "district",
      "unique_school_code",
      matrix_cols
    )
  )

obs_rel <- elem_score_diff %>% 
  group_by(district) %>%
  summarise(
    s1_e1_score = (sum((s1_e1_score == 0 | s1_e1_score == 1))/n()) * 100,
    s1_e2_score = (sum((s1_e2_score == 0 | s1_e2_score == 1))/n()) * 100,
    s1_e3_score = (sum((s1_e3_score == 0 | s1_e3_score == 1))/n()) * 100,
    s1_e4_score = (sum((s1_e4_score == 0 | s1_e4_score == 1))/n()) * 100,
    s1_e5_score = (sum((s1_e5_score == 0 | s1_e5_score == 1))/n()) * 100,
    s1_e6_score = (sum((s1_e6_score == 0 | s1_e6_score == 1))/n()) * 100,
    s1_e7_score = (sum((s1_e7_score == 0 | s1_e7_score == 1))/n()) * 100,
    s1_e8_score = (sum((s1_e8_score == 0 | s1_e8_score == 1))/n()) * 100,
    s1_e9_score = (sum((s1_e9_score == 0 | s1_e9_score == 1))/n()) * 100,
    s2_e1_score = (sum((s2_e1_score == 0 | s2_e1_score == 1))/n()) * 100,
    s2_e2_score = (sum((s2_e2_score == 0 | s2_e2_score == 1))/n()) * 100,
    s2_e3_score = (sum((s2_e3_score == 0 | s2_e3_score == 1))/n()) * 100,
    s2_e4_score = (sum((s2_e4_score == 0 | s2_e4_score == 1))/n()) * 100,
    s2_e5_score = (sum((s2_e5_score == 0 | s2_e5_score == 1))/n()) * 100,
    s2_e6_score = (sum((s2_e6_score == 0 | s2_e6_score == 1))/n()) * 100,
    s2_e7_score = (sum((s2_e7_score == 0 | s2_e7_score == 1))/n()) * 100,
    s2_e8_score = (sum((s2_e8_score == 0 | s2_e8_score == 1))/n()) * 100,
    s2_e9_score = (sum((s2_e9_score == 0 | s2_e9_score == 1))/n()) * 100
  )


obs_diff0 <- elem_score_diff %>% 
  group_by(district) %>%
  summarise(
    s1_e1_score = (sum(s1_e1_score == 0)/n()) * 100,
    s1_e2_score = (sum(s1_e2_score == 0)/n()) * 100,
    s1_e3_score = (sum(s1_e3_score == 0)/n()) * 100,
    s1_e4_score = (sum(s1_e4_score == 0)/n()) * 100,
    s1_e5_score = (sum(s1_e5_score == 0)/n()) * 100,
    s1_e6_score = (sum(s1_e6_score == 0)/n()) * 100,
    s1_e7_score = (sum(s1_e7_score == 0)/n()) * 100,
    s1_e8_score = (sum(s1_e8_score == 0)/n()) * 100,
    s1_e9_score = (sum(s1_e9_score == 0)/n()) * 100,
    s2_e1_score = (sum(s2_e1_score == 0)/n()) * 100,
    s2_e2_score = (sum(s2_e2_score == 0)/n()) * 100,
    s2_e3_score = (sum(s2_e3_score == 0)/n()) * 100,
    s2_e4_score = (sum(s2_e4_score == 0)/n()) * 100,
    s2_e5_score = (sum(s2_e5_score == 0)/n()) * 100,
    s2_e6_score = (sum(s2_e6_score == 0)/n()) * 100,
    s2_e7_score = (sum(s2_e7_score == 0)/n()) * 100,
    s2_e8_score = (sum(s2_e8_score == 0)/n()) * 100,
    s2_e9_score = (sum(s2_e9_score == 0)/n()) * 100
  )

obs_diff1 <- elem_score_diff %>% 
  group_by(district) %>%
  summarise(
    s1_e1_score = (sum(s1_e1_score == 1)/n()) * 100,
    s1_e2_score = (sum(s1_e2_score == 1)/n()) * 100,
    s1_e3_score = (sum(s1_e3_score == 1)/n()) * 100,
    s1_e4_score = (sum(s1_e4_score == 1)/n()) * 100,
    s1_e5_score = (sum(s1_e5_score == 1)/n()) * 100,
    s1_e6_score = (sum(s1_e6_score == 1)/n()) * 100,
    s1_e7_score = (sum(s1_e7_score == 1)/n()) * 100,
    s1_e8_score = (sum(s1_e8_score == 1)/n()) * 100,
    s1_e9_score = (sum(s1_e9_score == 1)/n()) * 100,
    s2_e1_score = (sum(s2_e1_score == 1)/n()) * 100,
    s2_e2_score = (sum(s2_e2_score == 1)/n()) * 100,
    s2_e3_score = (sum(s2_e3_score == 1)/n()) * 100,
    s2_e4_score = (sum(s2_e4_score == 1)/n()) * 100,
    s2_e5_score = (sum(s2_e5_score == 1)/n()) * 100,
    s2_e6_score = (sum(s2_e6_score == 1)/n()) * 100,
    s2_e7_score = (sum(s2_e7_score == 1)/n()) * 100,
    s2_e8_score = (sum(s2_e8_score == 1)/n()) * 100,
    s2_e9_score = (sum(s2_e9_score == 1)/n()) * 100
  )

obs_rel[matrix_cols] <- data.frame(lapply(obs_rel[matrix_cols], function(x) round(x, 0)))
obs_diff0[matrix_cols] <- data.frame(lapply(obs_diff0[matrix_cols], function(x) round(x, 0)))
obs_diff1[matrix_cols] <- data.frame(lapply(obs_diff1[matrix_cols], function(x) round(x, 0)))

obs_rel$Metric <- "Rel" 
obs_diff0$Metric <- "Diff = 0" 
obs_diff1$Metric <- "Diff = 1"

obs_rel_comb <- rbind(
  obs_rel,
  obs_diff0,
  obs_diff1
) [, c("district", "Metric", matrix_cols)] %>%
  arrange(district)
  
unlinkAndWrite(
  'ece-dash/Data/observation/observationRel.csv',
  obs_rel_comb
)

# 
da_teach_code <- DA_ %>%
  group_by(district, unique_school_code, teacher_code) %>%
  summarise(
    n_da = n(),
    grades_da = paste0(childs_grade, collapse = " | ")
  )

teach_code <- da_teach_code %>%
  full_join(obs_teach_code, by = c(
    "district",
    "unique_school_code",
    "teacher_code")
  ) %>%
  arrange(district, unique_school_code)

gradeList <- summ %>% 
  select(unique_school_code, n_ECE, n_katchi, n_grade1) %>%
  group_by(unique_school_code) %>%
  summarise(
    grades_roster = paste(c(
      ifelse(n_ECE > 0, "ECE", NA),
      ifelse(n_katchi > 0, "Katchi", NA),
      ifelse(n_grade1 > 0, "1st_Grade", NA)),
      collapse = " - "
    )
  )


gradeList$grades_roster <- gsub(pattern = "NA - ", replacement = "", gradeList$grades_roster)
gradeList$grades_roster <- gsub(pattern = "NA| - NA", replacement = "", gradeList$grades_roster)
gradeList$grades_roster <- gsub(pattern = "-", replacement = "|", gradeList$grades_roster)

teach_code_rost <- teach_code %>% left_join(gradeList, by = c("unique_school_code"))

teach_code_rost_sup <- teach_code_rost %>%
  left_join(
    summ %>% select(unique_school_code, date, supervisor, contact), 
    by = c("unique_school_code", "district")
  )

unlinkAndWrite(
  'ece-dash/Data/join-issues/teach_code.csv',
  teach_code_rost_sup
)
