# Input rnk and gmt files
rnk.file <- "COAD.tumor.vs.normal.rnk"
gmt.file <- "KEGG_CELL_CYCLE.v2022.1.Hs.ensg.gmt"

# Ranklist
ranks <- read.table(rnk.file,
    header = FALSE, skip = 1,
    colClasses = c("character", "numeric"),
    col.names = c("GeneID", "Rank"))
ranks <- setNames(ranks$Rank, ranks$GeneID)

# Gene set
pathways <- gmtPathways(gmt.file)

# Run GSEA analysis
fgsea.res <- fgsea(pathways = pathways, stats = ranks,
    eps = 1e-10)
head(fgsea.res[order(pval),])

# Export txt
fgsea.res.export <- fgsea.res
fgsea.res.export$leadingEdge <- sapply(
    fgsea.res.export$leadingEdge, paste, collapse = ";")
write.table(fgsea.res.export, file = "fGSEA.res.txt",
    sep = "\t", col.names = TRUE, row.names = FALSE)

# Export png
plot <- plotEnrichment(pathways$KEGG_CELL_CYCLE, ranks) + labs(title = "Cell Cycle")
ggsave("fGSEA.res.plot.png",
    plot = plot, width = 8, height = 6, dpi = 300)