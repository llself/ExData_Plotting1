#Exploratory Data Analysis Class through Coursera
#Leslie Self
#December 2, 2014
#Plot1.R - creates a plot  - histogram that is red displaying the frequency of the Global Active Power
# with main title "Global Active Power" and x-axis label as "Global Active Power(kilowatts)

library(sqldf)
library(lubridate)

#download file and then extract out what is needed for assignment:  only 2/1/2007-2/2/2007 data.
td = tempdir()   # create a temporary directory
tf = tempfile(tmpdir=td, fileext=".zip")  # create the placeholder file
download.file(fileURL, tf)  # download into the placeholder file
fname = unzip(tf, list=TRUE)$Name[1] # get the name of the first file in the zip which will be the only one in our case
unzip(tf, files=fname, exdir=getwd(), overwrite=TRUE) # unzip the file to the my working directory

#pulls in only data from Feb 1 2007 and Feb 2 2007 from dataset.
powerDS <- read.csv.sql("household_power_consumption.txt", 
                         sql = "select * from file where  Date = '1/2/2007' or Date= '2/2/2007'", 
                         header = TRUE, 
                         sep = ";") 

#create a POSIXct column for Date/Time
powerDS$DateTime <- as.POSIXct(paste(powerDS$Date, powerDS$Time), format="%d/%m/%Y %H:%M:%S")

#creates plot using basic plotting system.  
windows()
hist(powerDS$Global_active_power, col = "red", 
     xlab = "Global Active Power(kilowatts)", 
     main = "Global Active Power")

#copy my plot to a png file
#png file default pixels to 480x480 so I don't need to change size.
dev.copy(png, file = "plot1.png")
dev.off()