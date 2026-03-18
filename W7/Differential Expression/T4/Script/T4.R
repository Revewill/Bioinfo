# Read from table
DESeq2.raw.data <- read.table(
    "uvr8.light.vs.dark.all.DESeq2.txt",
    header = TRUE, sep = "\t", row.names = 1)
edgeR.raw.data <- read.table(
    "uvr8.light.vs.dark.all.edgeR.txt",
    header = TRUE, sep = "\t", row.names = 1)

# Select genes with significant expression changes
DESeq2.filtered.data <- DESeq2.raw.data[
    !is.na(DESeq2.raw.data$padj) &
    abs(DESeq2.raw.data$log2FoldChange) > 1 &
    DESeq2.raw.data$padj < 0.05,]
edgeR.filtered.data <- edgeR.raw.data[
    abs(edgeR.raw.data$logFC) > 1 &
    edgeR.raw.data$FDR < 0.05,]

# Determine intersection number
DESeq2.genes <- rownames(DESeq2.filtered.data)
edgeR.genes <- rownames(edgeR.filtered.data)

intersect <- length(intersect(DESeq2.genes, edgeR.genes))
DESeq2.only <- length(setdiff(DESeq2.genes, edgeR.genes))
edgeR.only <- length(setdiff(edgeR.genes, DESeq2.genes))

# Create Venn diagram
library(VennDiagram)
grid.newpage()
venn.plot <- draw.pairwise.venn(
    area1 = DESeq2.only + intersect,
    area2 = edgeR.only + intersect,
    cross.area = intersect,
    category = c("DESeq2", "edgeR"),
    fill = c("lightblue", "lightgreen"),
    alpha = 0.5,
    lty = "blank",
    cex = 1.5,
    cat.cex = 1.5,
    cat.pos = c(0, 0),
    cat.dist = 0.05
)

# Output as png
png("T4_results_venndiagram.png", width = 800, height = 600, res = 120)
grid.draw(venn.plot)
dev.off()