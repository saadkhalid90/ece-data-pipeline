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