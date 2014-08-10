data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE);
DatTim <- paste(data$Date, data$Time);
DT <- strptime(DatTim, "%d/%m/%Y %H:%M:%S");
data <- cbind(DT, data);
for (i in 4:9) data[, i] <- as.numeric(as.character(data[, i]));
subdata <- subset(data, DT >= "2007-02-01 00:00:00" & DT <= "2007-02-02 23:59:59");
png("plot3.png")
plot(subdata$DT, subdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0, 40));
lines(subdata$DT, subdata$Sub_metering_1);
lines(subdata$DT, subdata$Sub_metering_2, col = "red");
lines(subdata$DT, subdata$Sub_metering_3, col = "blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"));
dev.off();