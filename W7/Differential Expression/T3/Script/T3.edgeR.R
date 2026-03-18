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

# Generate condition and design for DESeq2
uvr8.conditions <- factor(
    c(rep("Control", 3), rep("Treatment", 3)),
    levels = c("Control","Treatment"))

uvr8.design <- model.matrix(~ uvr8.conditions)

# Use edgeR to analyze data
library(edgeR)
uvr8.result <- DGEList(counts = uvr8.filtered.counts)
# Generate TMM matrix
uvr8.result <- calcNormFactors(uvr8.result, method = "TMM")
# Esimate dispersion
uvr8.result <- estimateDisp(uvr8.result, design = uvr8.design)
fit <- glmFit(uvr8.result, design = uvr8.design)
# Likelihood ratio test (lrt)
lrt <- glmLRT(fit, coef = 2) 

# Output as .txt file
uvr8.result <- topTags(lrt, n = nrow(uvr8.result))$table
write.table(
    uvr8.result,
    "uvr8.light.vs.dark.all.edgeR.txt",
    sep='\t',
    row.names = TRUE,
    col.names = TRUE,
    quote = FALSE)