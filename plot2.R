fileUrl <- "household_power_consumption.txt";
date1 <- "1/2/2007";
date2 <- "2/2/2007";

file <- read.table(fileUrl, header=T, sep=";", stringsAsFactors =F);
data <- subset(file, file$Date == date1 | file$Date == date2);

days <- as.character(as.Date(data$Date, "%d/%m/%Y"));
datetime <- strptime(paste(days, data$Time), "%Y-%m-%d %H:%M:%S");
gap <-as.numeric(data$Global_active_power);

png("plot2.png");
plot(datetime, gap, type="l", ylab="Global Active Power (kilowatts)", xlab="");
dev.off();
