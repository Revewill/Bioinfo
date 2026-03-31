# Read from file and filter all invalid number
raw.table <- read.table(
    "DaPars_Test_data_All_Prediction_Results.txt",
    stringsAsFactors = FALSE, header = TRUE, sep = "\t")

nona.table <- na.omit(raw.table)

# Filter data by different methods
filtered.table1 <- nona.table[
    nona.table$adjusted.P_val <= 0.05 &
    nona.table$PDUI_Group_diff >= 0.5 &
    abs(log2(nona.table$Group_B_Mean_PDUI / nona.table$Group_A_Mean_PDUI)) >= 0.59
,]

filtered.table2 <- nona.table[
    nona.table$Pass_Filter == "Y"
,]

# View result
n1 <- nrow(filtered.table1)
n2 <- nrow(filtered.table2)
n1in2 <- length(intersect(
    filtered.table1$Gene, filtered.table2$Gene
))

cat("All genes selected via parameter filter: ", n1, "\n")
cat("All genes selected via pass filter: ", n2, "\n")
cat("Common genes selected: ", n1in2)