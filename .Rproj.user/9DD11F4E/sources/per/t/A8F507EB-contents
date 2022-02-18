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