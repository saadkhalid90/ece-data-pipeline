## define the UI of the app

ui <- basicPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  tabsetPanel(
    id = 'intervalDashContain',
    tabPanel("Summary", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("School Level Survey Summary", class="table_header"),
      p("The table shows the count of collected interviews for each school.", class="table-desc"),
      DT::dataTableOutput("surveySummary")
    )),
    tabPanel("School", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("Enrolment stats (School Information | Roster)", class="table_header"),
      p("The tables compare enrolment statistics between School Information and Roster instruments", class="table-desc"),
      h3("SI Sections | Roster Enrolment mismatch", class="sub-header"),
      DT::dataTableOutput("enrolComp1"),
      h3("SI Enrolment | Roster Enrolment mismatch (Section = 1)", class="sub-header"),
      DT::dataTableOutput("enrolComp2"),
      h3("SI Enrolment | Roster Enrolment mismatch (Section > 1)", class="sub-header"),
      DT::dataTableOutput("enrolComp3"),
      h2("Grade in combined class but enrolment data absent in roster", class="table_header"),
      p("The table shows cases where a particular grade is reported to be in a combined class but no enrolment data is reported in the roster", class="table-desc"),
      DT::dataTableOutput("inCombNotRoster"), 
      h2("School Year of Est. (Extreme cases)", class="table_header"),
      p("The table lists schools with extreme Year of establishment values", class="table-desc"),
      DT::dataTableOutput("extYOE"),
      h2("Too many bathrooms?", class="table_header"),
      DT::dataTableOutput("extBath") 
    )),
    tabPanel("Principal", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("Teaching Year", class="table_header"),
      p("The table shows inconsistencies in data pertaining to principals' years of service", class="table-desc"),
      DT::dataTableOutput("princYear"),
      h2("Salary", class="table_header"),
      p("The table shows inconsistencies in principals' salary data", class="table-desc"),
      DT::dataTableOutput("princSalary"),
      h2("Too many training topics?", class="table_header"),
      DT::dataTableOutput("princTrain"),
      h2("Pre-primary classes reported | Roster", class="table_header"),
      DT::dataTableOutput("princPrePrim")
    )),
    tabPanel("Teacher", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("Teaching Year", class="table_header"),
      p("The table shows inconsistencies in data pertaining to teachers' years of service", class="table-desc"),
      DT::dataTableOutput("teachYear"),
      h2("Age married outliers", class="table_header"),
      DT::dataTableOutput("marriageChecks"),
      h2("Grade Taught | School Info | Roster", class="table_header"),
      DT::dataTableOutput("teachECEKatchiCheck"),
      h2("To many classes?", class="table_header"),
      DT::dataTableOutput("tooManyClassesCheck"),
      h2("Family Income | Personal Income", class="table_header"),
      DT::dataTableOutput("familPersonIncomeCheck"),
      h2("Tuition start | Teaching start", class="table_header"),
      DT::dataTableOutput("tuitTeachStartCheck"),
      h2("ECE Training | Roster", class="table_header"),
      DT::dataTableOutput("ECETrainRostComp"),
      h2("Time spent in school", class="table_header"),
      DT::dataTableOutput("teachTimeCheck"),
      h2("Failed | Returned Students", class="table_header"),
      DT::dataTableOutput("failRetCheck")
    )),
    tabPanel("Parent", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("Child's age outliers", class="table_header"),
      DT::dataTableOutput("ageChildCheck"),
      h2("Child caregiving hours", class="table_header"),
      DT::dataTableOutput("careGiveCheck")
    )),
    tabPanel("TEACH ECE", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("Teacher's Reliability", class="table_header"),
      p("The table shows relatiability of enumaerator pairs conducting classroom observations", class="table-desc"),
      DT::dataTableOutput("teachRel")
    )),
    tabPanel("DA (AIM ECD)", div(
      id="summTableContain",
      style = "font-size: 90%",
      div(
        class="sub_contain_DA",
        p("These tables show percentage of students who responded to the assessment items/ questions correctly", class="table-desc"),
        h2("Early Litearcy", class="table_header"),
        h3("1. Listening Comprehension", class="sub-header"),
        DT::dataTableOutput("lit_1"),
        h3("2. Letter Identification (Urdu)", class="sub-header"),
        DT::dataTableOutput("lit_2"),
        h3("3. Initial sound discrimination", class="sub-header"),
        DT::dataTableOutput("lit_3"),
        h3("4. Name Writing", class="sub-header"),
        DT::dataTableOutput("lit_5"),
        h3("E2. Letter Identification (English)", class="sub-header"),
        DT::dataTableOutput("lit_4"),
      ),
      div(
        class="sub_contain_DA",
        h2("Early Numeracy", class="table_header"),
        h3("5. Spatial Vocabulary", class="sub-header"),
        DT::dataTableOutput("num_1"),
        h3("6. Producing a set", class="sub-header"),
        DT::dataTableOutput("num_2"),
        h3("7. Simple Addition", class="sub-header"),
        DT::dataTableOutput("num_3"),
        h3("8. Number Identification", class="sub-header"),
        DT::dataTableOutput("num_4"),
        h3("9. Number Comparison", class="sub-header"),
        DT::dataTableOutput("num_5"),
        h3("10. Shape Identification", class="sub-header"),
        DT::dataTableOutput("num_6"),
      ),
      div(
        class="sub_contain_DA",
        h2("Executive Functioning", class="table_header"),
        h3("11. Head, Feet, Knees, Shoulder", class="sub-header"),
        DT::dataTableOutput("exf_1"),
        h3("12.Forward Digit Span", class="sub-header"),
        DT::dataTableOutput("exf_2"),
        h3("13. Backward Digit Span", class="sub-header"),
        DT::dataTableOutput("exf_3"),
      ),
      div(
        class="sub_contain_DA",
        h2("Socio-emotional Skills", class="table_header"),
        p("Table shows percentage of observer pairs who were reported to be reliable (difference at most within 1 element score)"),
        h3("14. Perspective Taking/ Empathy", class="sub-header"),
        DT::dataTableOutput("soc_1")
      )
    )),
    tabPanel("ECE-DA Join", div(
      id="summTableContain",
      style = "font-size: 90%",
      h2("TEACH-ECE and AIM-ECD mapping issues", class="table_header"),
      DT::dataTableOutput("teachAimMap")
    ))
  ),
  p(paste('Last updated:', timeUpdated), class="update-text")
)