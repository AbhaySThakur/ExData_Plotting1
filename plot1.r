#Assignment 1 PLOT 1
#-----------------------------------------------------------------------------
#"Individual household electric power consumption Data Set"
#-----------------------------------------------------------------------------
#Check: Code folder should contain the following data folder and data
filepath <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
if(!file.exists(filepath)){
	print("Path or the input files does not exists")
} else{
        print("OK, file found")	
}
#Data processing---------------------------------------------------------------
#Step 1 : Loading data file for date between 2007-02-01 and 2007-02-02
library(sqldf)
mysql <- 'select * from file where Date = "1/2/2007" or Date ="2/2/2007"'
data_step1 <- read.csv.sql(file = filepath, sql = mysql,sep = ";",header = TRUE)
#View(data_step1)

#Step 2 : Convert date and time variable
datetime <- as.POSIXlt(paste(data_step1$Date,data_step1$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
data_step2 <- cbind(data_step1,datetime)

#Step 3 : Check for missing values in variable "?"
str(data_step2)
#View(data_step2)
summary(data_step2) 
#Oberservation: no missing values were found

#Step 4: Fork github repo https://github.com/rdpeng/ExData_Plotting1
dev.cur()
png(file="./plot1.png",bg="transparent",width=480,height=480,units="px")
#PLOT 1
hist(data_step2$Global_active_power, col="red", xlab="Global Active Power(kilowatts)"
     ,main="Global Active Power")
dev.off()