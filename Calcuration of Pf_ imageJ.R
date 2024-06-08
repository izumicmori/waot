# <Must input data> ----------------------------------------------
# Please input A0 and relative volume at 90 (A90)
A0 <- c(414192.603,409004.956,427992.522,404347.776,389128.08,436456.576,437767.14)

A90 <- c(426689.76,427953.517,454952.681,419887.312,394736.979,460389.958,461957.954)

#-----------------------------------------------------------------

# <Optional> -----------------------------------------------------
# NO BURST of OOCYTE, Do Not Change.
Period_of_assay = 90

# used 1/5 MBS? Use "160".
# If used 1/4 MBS, change here to "150". If used 1/2 MBS, change here to "100". 
Dif_in_Osm = 160
#-----------------------------------------------------------------

# <Do not change> ------------------------------------------------
# Pi and Water_vol are fixed value. Do not change.
Pi = 3.141592
Water_vol = 18

# take ratio
Rel_vol_90s = (A90/A0)^(3/2)

Rel_vol_90s

# calculation of Pf
Pf_val=sqrt(A0/3800000/Pi)/3/Water_vol*(Rel_vol_90s - 1)/Period_of_assay/Dif_in_Osm*10^8

# Output the result as a CSV file.
Dataframe2 <- data.frame(Pf_val, Period_of_assay, Dif_in_Osm)
write.csv(Dataframe2, "Pf_results.csv")

# The Pf_results.csv file is located at
getwd()
#----------------------------------------------------------------