#Exploratory Data Analysis Class through Coursera
#Leslie Self
#December 2, 2014
#Plot2.R - creates a plot  - line chart that with black lines displaying the frequency of the Global Active Power
# based on day.  Y-axis label should be "Global Active Power(kilowatts)


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

#creates plot using basic plotting system.  
#Column 10 is my DateTime column in POSIXct format and column 3 is the Global Power
windows()
plot(powerDS[,10], powerDS[,3], 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#png file default pixels to 480x480 so I don't need to change size.
dev.copy(png, file = "plot2.png")
dev.off()