# Object of this program is to create plots using the base plot
# Create a Histogram of the distribution of Global Active Power and Frequency

# Step 1 - Check if Coursera directory exists

  if(!file.exists("C:\\coursera_project")) {
    dir.create("C:\\coursera_project")
  }
  setwd("C:\\coursera_project")

# Step 2 - Download the Power data zip file

  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  unzip(temp, "household_power_consumption.txt")
  unlink(temp)

# Step 3 - Searching for the beginning of 1/2/2007 data and loading into a dat vector 

  temp_dates <- scan("household_power_consumption.txt", what = "", flush = TRUE,sep = ";",nlines = 100000 )

  lines_skip <- grep("1/2/2007",temp_dates, fixed=TRUE)[1]-1
  dat <-read.csv("household_power_consumption.txt", skip = lines_skip, nrows = 2880, header = FALSE, sep = ";", quote = "\"", fill = TRUE)
  colnames(dat) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


# Step 4 - Plot the Histogram
  hist(dat[[3]],col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
  dev.copy(png,'plot1.png',width=480,height=480)
  dev.off()

