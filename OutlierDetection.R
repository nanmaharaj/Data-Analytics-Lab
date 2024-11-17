file_path<-"/Users/nandinimaharaj/Downloads/bike+sharing+dataset/day.csv"
day<-read.csv(file_path)
View(day)

sum(is.na(day))
boxplot(day[,c("temp","hum","windspeed")])

for(i in c("hum","windspeed"))
{
  data<-unlist(day[i])
  newData<-data[data %in% boxplot.stats(data)$out]
  data[data %in% newData]<-NA
  day[i]<-data
}

sum(is.na(data))
day<-na.exclude(day)
boxplot(day[,c("temp","hum","windspeed")])