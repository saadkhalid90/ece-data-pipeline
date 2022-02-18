buttonStyle = '$("button.dt-button")
                    .css("background-color","#0D47A1")
                    .css("color","white")
                    .css("border","none");
                    return table;'

server <- function(input, output) {
  output$surveySummary = DT::renderDataTable(server = FALSE, {
    as.datatable(
      formattedSumm,
      options = list( 
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )  
  })
  
  output$enrolComp1 = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      schoolEnrolCompare1,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$enrolComp2 = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      schoolEnrolCompare2,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$enrolComp3 = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      schoolEnrolCompare3,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$inCombNotRoster = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      combClassRostCompFilt,
      options = list(
        pageLength = 10,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$extYOE = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      weirdYOEDF,
      options = list(
        pageLength = 10,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$extBath = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      weirdBath,
      options = list(
        pageLength = 10,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$princYear = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      princYearChecks,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$princSalary = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      salaryChecks,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$princTrain = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      nTopicChecks,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$princPrePrim = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      prePrimChecksFilt,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$teachYear = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      teachYearChecks,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$marriageChecks = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      marriageChecks,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$teachECEKatchiCheck = DT::renderDataTable(server = FALSE, {
    DT::datatable(
      teachECEKatchiCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$tooManyClassesCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      tooManyClassesCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$familPersonIncomeCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      familPersonIncomeCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$tuitTeachStartCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      tuitTeachStartCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$ECETrainRostComp = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      ECETrainRostComp,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$teachTimeCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      teachTimeCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$failRetCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      failRetCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$ageChildCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      ageChildCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$careGiveCheck = DT::renderDataTable(server = FALSE, { 
    DT::datatable(
      careGiveCheck,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$lit_1 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_lit_1,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$lit_2 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_lit_2,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$lit_3 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_lit_3,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$lit_4 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_lit_4,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$lit_5 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_lit_5,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$num_1 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_num_1,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$num_2 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_num_2,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$num_3 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_num_3,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$num_4 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_num_4,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$num_5 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_num_5,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$num_6 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_num_6,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$exf_1 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_exf_1,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$exf_2 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_exf_2,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$exf_3 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_exf_3,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$soc_1 = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_soc_1,
      options = list(
        pageLength = 20,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    )
  })
  
  output$teachRel = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_teach_rel,
      options = list(
        pageLength = 30,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    ) 
  })
  
  output$teachAimMap = DT::renderDataTable(server = FALSE, { 
    as.datatable(
      formatted_teach_code,
      filter = list(
        position="top"
      ),
      options = list(
        pageLength = 50,
        buttons = c('csv', 'excel'),
        dom = 'Bfrtip'
      ),
      extensions = 'Buttons',
      callback=JS(buttonStyle)
    ) 
  })
}