library(dplyr)
setwd("C:/Users/Arjitkp/Desktop")
if(!file.exists("Week4")){
  dir.create("Week4")
}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./Week4/Run_analysis.zip")

file_list<-(unzip("./Week4/Run_analysis.zip"))

x_test<-tbl_df(read.table(file_list[15]))


features<-tbl_df(read.table(file_list[2]))
  colnames(features)<-c("Feature_id","Feature_type")
  features$Feature_type<-as.character(features$Feature_type)
  cnames<-features$Feature_type
  colnames(x_test)<-c(cnames)
  

  selected_col<-grepl("mean()|std",names(x_test))
  x_test<-x_test[,selected_col]
  selected_col<-grepl("Freq",names(x_test))
  x_test<-x_test[,!selected_col]

y_test<-tbl_df(read.table(file_list[16]))
  colnames(y_test)<-c("Activity_id")
  
s_test<-tbl_df(read.table(file_list[14]))
  colnames(s_test)<-c("Subject_id")
  
a_labels<-tbl_df(read.table(file_list[1]))
  colnames(a_labels) <- c("Activity_id","Activity")
  
ay<-inner_join(y_test,a_labels,by="Activity_id")
say<-cbind(s_test,ay)
xsay<-cbind(say,x_test)






final_test<-xsay
###################################################
x_train<-tbl_df(read.table(file_list[27]))



colnames(x_train)<-c(cnames)


selected_col<-grepl("mean()|std",names(x_train))
x_train<-x_train[,selected_col]
selected_col<-grepl("Freq",names(x_train))
x_train<-x_train[,!selected_col]

y_train<-tbl_df(read.table(file_list[28]))
colnames(y_train)<-c("Activity_id")

s_train<-tbl_df(read.table(file_list[26]))
colnames(s_train)<-c("Subject_id")


ay<-inner_join(y_train,a_labels,by="Activity_id")
say<-cbind(s_train,ay)
xsay<-cbind(say,x_train)

final_train<-xsay
#############################

processed_data<-rbind(final_test,final_train)
#######################################################3

Final_group<-group_by(processed_data,Subject_id,Activity)
Tidy_data<-summarise_each(Final_group,funs(mean))

write.table(Tidy_data,"Tidy_data.txt")

