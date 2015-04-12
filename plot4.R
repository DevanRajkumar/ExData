fileUrl <- "household_power_consumption.txt";
date1 <- "1/2/2007";
date2 <- "2/2/2007";

file <- read.table(fileUrl, header=T, sep=";", stringsAsFactors =F);
data <- subset(file, file$Date == date1 | file$Date == date2);

days <- as.character(as.Date(data$Date, "%d/%m/%Y"));
datetime <- strptime(paste(days, data$Time), "%Y-%m-%d %H:%M:%S");

gap <-as.numeric(data$Global_active_power);
voltage <- as.numeric(data$Voltage);
grp <- as.numeric(data$Global_reactive_power);

subm1 <- as.numeric(data$Sub_metering_1);
subm2 <- as.numeric(data$Sub_metering_2);
subm3 <- as.numeric(data$Sub_metering_3);

png("plot4.png");
par(mfrow = c(2, 2));
plot(datetime, gap, type="l", ylab="Global Active Power", xlab="");

plot(datetime, voltage, type="l", ylab="Voltage");

plot(datetime, subm1, type="l", ylab="Energy sub metering", xlab="");
lines(datetime, subm2, type="l",  col="red");
lines(datetime, subm3, type="l", col="blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2, col=c("black", "red", "blue"), bty = "n");

plot(datetime, grp, type="l", ylab="Global_reactive_power");
dev.off();
