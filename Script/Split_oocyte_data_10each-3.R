#Loading packages
library(dplyr)
library(stringr)
library(openxlsx)

#Data import using dplyr
Dir1 <- file.choose()
Dir1

df0 <- read.csv(Dir1)
df0 <- df0 %>%
  dplyr::rename("Number" = 1, "Label" = 2, "Area" = 3)
head(df0) #debug command


#check the data length whether it is a multiple of 10.
if (nrow(df0) %% 10 == 0) {
  
  #Data set number（Dsn）= 1/10 of row number.
  Dsn <- nrow(df0)/10
  
  #Make empty list
  List1 <- list()
  List_name <- list()
  List2 <- list()
  List_name2 <-list()
  
  #Repeat extract 10 data each until the end of the data set (Dsn)
  for (i in 1:Dsn){
    x <-  df0 %>%
       filter(between(Number, left = (i*10-9), right = i*10)) #Select data in df0 with 1 to 10, 11 to 20... in "x".
    List1 <- append(List1, list(x[1],x[2],x[3])) 
    List_name <- append(List_name, list("Number","Label","Area"))
    
    #get pearson's correlation coeficient
    Pearson_R <- cor(c(1:10), unlist(list(x[3])), method = c("pearson"))
    List2 <- append(List2, Pearson_R)
    #Name of picture file
    List2_label <- unlist(list(x[2])) #All 10 pictures form the list
    List2_label2 <- c(List2_label[1]) #Pick the 1st picture name 
    List2_label3 <- str_sub(List2_label2, start = 1, end = -5) #delete the extention.
    List_name2 <- append(List_name2,List2_label3) #Add name of picture file to the list
  }
  #For loop end.
  
  #Make a data frame for data output
  df1 <-data.frame(List1)
  #Change column name since a list has strange name different from a data frame.
  colnames(df1) <- c(List_name)
  #print(df1) #debug command
  
  #make a data frame for Pearson's correlation coefficients
  df2 <-data.frame(List2)
  #Replace column name to the file name
  colnames(df2) <-c(List_name2)
  
  #Get time
  CurTime <-Sys.time() %>% format("%Y-%m-%d_%H-%M")
  #CurTime
  
  #Save data as Xlsx with current time using openxlsx.
  write.xlsx(df1, paste0("Results_", CurTime, ".xlsx"))
  write.xlsx(df2, paste0("ResultsCor_", CurTime, ".xlsx"))
  getwd()
  
  #Show a error message when the number of data was not a multiple of 10.
}else{
  print("ERROR: Number of data is not a multiple of 10. Please check the Oocyte area data")
}
