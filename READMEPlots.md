Exploratory Data Analysis
Course Project 1
======================

Course Project 1 for Exploratory Data Analysis.  

The goal of this assignment is to pull the Electric Power Consumption data from the UC Irvine Macine Learning Repository and load into R all data for February 1, 2007 and February 2, 2007.  Once we have this data, we are to recreate four different plots shown in the README from our professor.  

* Since we are to provide 4 R scripts, I re-created the download from the web, the upload into R on each different plot r script.  

* When loading my data into r, I used a sql script to restrict my dataset to only include the two days of interest for this assignment.  Feb. 1, 2007 and Feb 2, 2007.
     
* the Date and Time functions are brought into R as characters.  I combined those two fields into another column called DateTime with a format of POSIXcT and used that field to plot my x-axis on many of the plots.
     
