#Creating Visualizations for Questionnaire Data
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Downloading Packages

#Download WORDCLOUD here: http://cran.cnr.berkeley.edu/web/packages/index.html

#Load packages in the 'Packages' Tab of the bottom-right console by selecting
#'Install Packages' and locating the downloaded files in your Downloads directory
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Importing Data

#Locate the directory to which you saved FinalData.csv
#Be sure to seperate subdirectory names with \\

data=read.csv("INSERT\\FILE\\DIRECTORY\\HERE\\FinalData.csv")
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Summary Statistics (for data-knowledge purposes)

#Average Aural Score
summary(data$Aural)

#Average Kinesthetic Score
summary(data$Kinesthetic)

#Average Read_Write Score
summary(data$Read_Write)

#Average Visual Score
summary(data$Visual)
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Creating Histograms for Learning Styles
par(mfrow=c(1,2))
#Aural
hist(data$Aural, xlim = c(0,15), ylim = c(0,10), 
     xlab = "Scores", main ="Aural Scores Distribution", 
     density=75, col = "blue")
segments(mean(data$Aural),0,mean(data$Aural),9,lwd=4)
text(mean(data$Aural),9.3,paste("Average Score",
     format(round(mean(data$Aural), 2), nsmall = 2)))
#Kinesthetic
hist(data$Kinesthetic, xlim = c(0,15), ylim = c(0,10), 
     xlab= "Scores", main = "Kinesthetic Scores Distribution",
     density=75, col = "red")
segments(mean(data$Kinesthetic),0,mean(data$Kinesthetic),9,lwd=4)
text(mean(data$Kinesthetic)+1,9.3,paste("Average Score",
     format(round(mean(data$Kinesthetic), 2), nsmall = 2)))
#Read & Write
hist(data$Read_Write, xlim = c(0,15), ylim = c(0,10), 
     xlab= "Scores", main = "Read & Write Scores Distribution",
     density=75, col = "dark green")
segments(mean(data$Read_Write),0,mean(data$Read_Write),9,lwd=4)
text(mean(data$Read_Write),9.3,paste("Average Score",
     format(round(mean(data$Read_Write), 2), nsmall = 2)))
#Visual
hist(data$Visual, xlim = c(0,15), ylim = c(0,10), 
     xlab= "Scores", main = "Visual Scores Distribution",
     density=75, col = "orange")
segments(mean(data$Visual),0,mean(data$Visual),9,lwd=4)
text(mean(data$Visual)-1.5,9.3,paste("Average Score",
     format(round(mean(data$Visual), 2), nsmall = 2)))
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Pie Charts
#Perecentage of class that has taken Stat 133
r.percentage <- sum(data$STAT133)/nrow(data)*100

#Percentage of class that has taken a CS course
percentage <- sum(data$CS)/nrow(data)*100

par(mfrow=c(1,1))
pie.data <- c(100,percentage)
pie(pie.data, 
    labels = c("No Computer Science Experience","Computer Science Experience"), 
    main="% of class with Computer Science Experience")
pie.data.two <- c(r.percentage,100)
pie(pie.data.two, labels= c("No R Expierence", "R Experience"), 
    main = "% of class with R Experience")
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Wordle
