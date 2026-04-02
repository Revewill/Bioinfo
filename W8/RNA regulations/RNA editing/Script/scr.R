library(ggplot2)

result <- read.table("chr1.editingSites.dist.txt", header = FALSE, col.names = c("Region", "Edits"))

png("chr1.editingSites.dist.png", width = 6, height = 4, units = "in", res = 300)
ggplot(result, aes(x = Region, y = Edits, fill = Region)) +
  geom_bar(stat = "identity") +
  labs(x = "Genomic Region", y = "Number of RNA Editing Sites") +
  theme_minimal() + 
  theme(legend.position="none")
dev.off()