#Creating Visualizations for Questionnaire Data

#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Importing Data

#Locate the directory to which you saved FinalData1.csv and FinalData2.csv
#Be sure to seperate subdirectory names with \\
data=read.csv("INSERT\\FILE\\DIRECTORY\\HERE\\FinalData1.csv")
data2=read.csv("INSERT\\FILE\\DIRECTORY\\HERE\\FinalData2.csv")
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
     density=70, col = "blue")
segments(mean(data$Aural),0,mean(data$Aural),9,lwd=4)
text(mean(data$Aural),9.3,paste("Average Score",
     format(round(mean(data$Aural), 2), nsmall = 2)))
#Kinesthetic
hist(data$Kinesthetic, xlim = c(0,15), ylim = c(0,10), 
     xlab= "Scores", main = "Kinesthetic Scores Distribution",
     density=70, col = "red")
segments(mean(data$Kinesthetic),0,mean(data$Kinesthetic),9,lwd=4)
text(mean(data$Kinesthetic)+1,9.3,paste("Average Score",
     format(round(mean(data$Kinesthetic), 2), nsmall = 2)))
#Read & Write
hist(data$Read_Write, xlim = c(0,15), ylim = c(0,10), 
     xlab= "Scores", main = "Read & Write Scores Distribution",
     density=70, col = "dark green")
segments(mean(data$Read_Write),0,mean(data$Read_Write),9,lwd=4)
text(mean(data$Read_Write),9.3,paste("Average Score",
     format(round(mean(data$Read_Write), 2), nsmall = 2)))
#Visual
hist(data$Visual, xlim = c(0,15), ylim = c(0,10), 
     xlab= "Scores", main = "Visual Scores Distribution",
     density=70, col = "orange")
segments(mean(data$Visual),0,mean(data$Visual),9,lwd=4)
text(mean(data$Visual)-1.5,9.3,paste("Average Score",
     format(round(mean(data$Visual), 2), nsmall = 2)))
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#Pie Charts
XML=data2$XML
C=data2$C
PHP=data2$PHP
Java=data2$Java
Scala=data2$Scala
Python=data2$Python
Pascal=data2$Pascal
Pig=data2$Pig
Unix=data2$Unix
HTML=data2$HTML
Matlab=data2$Matlab
SQL=data2$SQL
R=data2$R
Scheme=data2$Scheme
ruby=data2$ruby
CSS=data2$cSS
list=c(XML,PHP,C,Scala,Java,Pascal,HTML,Pig,Python,Unix,Matlab,SQL,
       R,Scheme,CSS)

par(mfrow=c(1,1))
pie(list,labels = 
          c("XML","PHP","C","Scala","Java","Pascal","HTML","Pig","Python","Unix",
            "Matlab","SQL","R","Scheme","CSS"), main="Program Proficiencies")
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------

