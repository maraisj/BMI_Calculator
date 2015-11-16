
shinyServer(function(input, output) {
        output$text1 <- renderText({ 
                bmi<-input$weight/input$height^2
                if (bmi<18.5)  classification<-"Underweight."
                if (bmi>=18.5&&bmi<=25)  classification<-"Normal weight."
                if (bmi>25&&bmi<=30)  classification<-"Overweight."
                if (bmi>30)  classification<-"Obese."
                paste("With a weight of ", input$weight,"kg and a height of ", input$height,"m, the calculated BMI is ",round(input$weight/input$height^2,digits=2),". The classification for this BMI is: ",classification)
        })
        output$text1I <- renderText({ 
                bmiI<-703*input$weightI/(input$heightIF*12+input$heightII)^2
                if (bmiI<18.5)  classification<-"Underweight."
                if (bmiI>=18.5&&bmiI<=25)  classification<-"Normal weight."
                if (bmiI>25&&bmiI<=30)  classification<-"Overweight."
                if (bmiI>30)  classification<-"Obese."
                paste("With a weight of ", input$weightI,"pounds and a height of ", input$heightIF," feet and", input$heightII,"inches , the calculated BMI is ",round(703*input$weightI/(input$heightIF*12+input$heightII)^2,digits=2),". The classification for this BMI is: ",classification)
        })
})