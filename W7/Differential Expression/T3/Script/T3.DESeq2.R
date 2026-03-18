# Read from table and filter uvr8 counts
raw.counts <- read.table(
    "count_exon.txt",
    sep='\t',
    header = TRUE,
    row.names = 1)

uvr8.raw.counts <- raw.counts[,c(
    "UD1_1", "UD1_2", "UD1_3",
    "UD0_1", "UD0_2", "UD0_3")]

uvr8.filtered.counts <- uvr8.raw.counts[rowMeans(
    uvr8.raw.counts) > 5, ]

# Generate condition and colData for DESeq2
uvr8.conditions <- factor(
    c(rep("Control", 3), rep("Treatment", 3)),
    levels = c("Control","Treatment"))

uvr8.colData <- data.frame(
    row.names = colnames(uvr8.filtered.counts),
    conditions=uvr8.conditions)

# Use DESeq2 to analyze data
suppressPackageStartupMessages(library(DESeq2))
# Create dataset
uvr8.dataset <- DESeqDataSetFromMatrix(
    uvr8.filtered.counts,
    uvr8.colData,
    design = ~ conditions)
# Analyze
uvr8.dataset <- DESeq(uvr8.dataset)
uvr8.result <- results(uvr8.dataset)

# Output as .txt file
write.table(
    uvr8.result,
    "uvr8.light.vs.dark.all.DESeq2.txt",
    sep='\t',
    row.names = TRUE,
    quote = FALSE)