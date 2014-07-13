data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE);
DatTim <- paste(data$Date, data$Time);
DT <- strptime(DatTim, "%d/%m/%Y %H:%M:%S");
data <- cbind(DT, data);
for (i in 4:9) data[, i] <- as.numeric(as.character(data[, i]));
subdata <- subset(data, DT >= "2007-02-01 00:00:00" & DT <= "2007-02-02 23:59:59");
png("plot2.png")
plot(subdata$DT, subdata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)");
lines(subdata$DT, subdata$Global_active_power);
dev.off();
