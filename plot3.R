#Exploratory Data Analysis Class through Coursera
#Leslie Self
#December 4, 2014
#Plot3.R - creates a plot  - 3 line charts to show the different sub metering values in reference to Date/Time

library(sqldf)
library(lubridate)

#download file and then extract out what is needed for assignment:  only 2/1/2007-2/2/2007 data.
td = tempdir()   # create a temporary directory
tf = tempfile(tmpdir=td, fileext=".zip")  # create the placeholder file
download.file(fileURL, tf)  # download into the placeholder file
fname = unzip(tf, list=TRUE)$Name[1] # get the name of the first file in the zip which will be the only one in our case
unzip(tf, files=fname, exdir=getwd(), overwrite=TRUE) # unzip the file to the my working directory

#pulls in only data from Feb 1 2007 and Feb 2 2007 from dataset.  Format of date is in d/m/y
powerDS <- read.csv.sql("household_power_consumption.txt", 
                        sql = "select * from file where  Date = '1/2/2007' or Date= '2/2/2007'", 
                        header = TRUE, 
                        sep = ";") 

#create a POSIXct column for Date/Time
powerDS$DateTime <- as.POSIXct(paste(powerDS$Date, powerDS$Time), format="%d/%m/%Y %H:%M:%S")

#create my plot in png file  - couldn't use the dev.copy because it didn't show the entire legend
png(file = "plot3.png")

#creates plot
with(powerDS, plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab="",  type = "l"))
lines(powerDS[,10],powerDS[ ,8], col="red")  # 8th column = sub_metering_2, 10th = DateTime column
lines(powerDS[,10],powerDS[ ,9], col="blue")  #9th column = sub_metering_3,  10th = DateTime column
legend("topright", c("Sub_metering_1", "Sub_Metering_2", "Sub_metering_3"), 
       lty=c("solid","solid","solid"),  #solid line
       col = c("black", "red", "blue")) #provides color

#close png file
dev.off()