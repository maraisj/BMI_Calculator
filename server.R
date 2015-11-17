
shinyServer(function(input, output) {
        output$mytable <- renderTable({
                bmi<-input$weight/input$height^2
                if (bmi<18.5)  classification<-"Underweight"
                if (bmi>=18.5&&bmi<=25)  classification<-"Normal weight"
                if (bmi>25&&bmi<=30)  classification<-"Overweight"
                if (bmi>30)  classification<-"Obese"
                normalLower<-round(18.5*input$height^2,1)
                normalHigher<-round(25*input$height^2,1)
                dat <- data.frame(
                        Parameter = c('Height [m]', 'Weight [kg]',"BMI","BMI Classification","Ideal weight range [kg]"),
                        Value=c(input$height,input$weight,round(bmi,1),classification,paste(normalLower,"-",normalHigher))
                       # flag = c('<img src="http://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/200px-Flag_of_the_United_States.svg.png"></img>', '<img src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/200px-Flag_of_the_People%27s_Republic_of_China.svg.png"></img>')
                )
        },
        sanitize.text.function = function(x) x)
        output$mytableI <- renderTable({
                bmiI<-703*input$weightI/(input$heightIF*12+input$heightII)^2
                if (bmiI<18.5)  classificationI<-"Underweight"
                if (bmiI>=18.5&&bmiI<=25)  classificationI<-"Normal weight"
                if (bmiI>25&&bmiI<=30)  classificationI<-"Overweight"
                if (bmiI>30)  classificationI<-"Obese"
                normalLowerI<-round(18.5*(input$heightIF*12+input$heightII)^2/703,1)
                normalHigherI<-round(25*(input$heightIF*12+input$heightII)^2/703,1)
                dat <- data.frame(
                        Parameter = c('Height [Imperial]', 'Weight [pounds]',"BMI","BMI Classification","Ideal weight range [pounds]"),
                        Value=c(paste(input$heightIF," Feet ",input$heightII," Inches")      ,input$weightI,round(bmiI,1),classificationI,paste(normalLowerI,"-",normalHigherI))
                        # flag = c('<img src="http://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/200px-Flag_of_the_United_States.svg.png"></img>', '<img src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/200px-Flag_of_the_People%27s_Republic_of_China.svg.png"></img>')
                )
        },
        sanitize.text.function = function(x) x)
        
})