fileUrl <- "household_power_consumption.txt";
date1 <- "1/2/2007";
date2 <- "2/2/2007";

file <- read.table(fileUrl, header=T, sep=";", stringsAsFactors =F);
data <- subset(file, file$Date == date1 | file$Date == date2);
gap <- as.numeric(data$Global_active_power)

png("plot1.png");
hist(gap, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)");
dev.off();
