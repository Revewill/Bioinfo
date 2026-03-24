# Load required libraries
library(ggplot2)
library(dplyr)
library(grid)
library(gridExtra)
library(cowplot)

# Read data
df <- read.csv("annotation.csv", stringsAsFactors = FALSE)

# Separate gene and transcript data
gene_data <- df[1:4, ]
transcript_data <- df[5:12, ]

# Prepare gene stacked bar data (exclude "All genes" from the stack)
gene_stack <- gene_data[gene_data$Type != "All genes", ] %>%
  mutate(
    Count_Pct = Count / sum(Count) * 100,
    Length_Pct = Total_Length_bp / sum(Total_Length_bp) * 100
  ) %>%
  arrange(desc(Count_Pct))

# Prepare transcript stacked bar data
transcript_stack <- transcript_data %>%
  mutate(
    Count_Pct = Count / sum(Count) * 100,
    Length_Pct = Total_Length_bp / sum(Total_Length_bp) * 100
  ) %>%
  arrange(desc(Count_Pct))

# Define color palettes
gene_colors <- c(
  "Protein-coding genes" = "#4A90E2",
  "Non-coding RNA genes" = "#E8A735",
  "Pseudogenes" = "#7F8C8D"
)

transcript_colors <- c(
  "lncRNA transcripts" = "#E74C3C",
  "miRNA transcripts" = "#F39C12",
  "misc_RNA transcripts" = "#27AE60",
  "rRNA transcripts" = "#3498DB",
  "snRNA transcripts" = "#9B59B6",
  "snoRNA transcripts" = "#1ABC9C",
  "tRNA transcripts" = "#E67E22",
  "mRNA transcripts" = "#16A085"
)

# Function to create stacked bar with conditional text (threshold 20%)
create_stacked_bar <- function(data, x_label, title, subtitle, colors, y_var = "Count_Pct") {
  
  data <- data %>%
    mutate(
      cumulative = cumsum(!!sym(y_var)),
      y_start = cumulative - !!sym(y_var),
      y_mid = y_start + !!sym(y_var) / 2,
      show_label = !!sym(y_var) >= 20
    )
  
  p <- ggplot(data, aes(x = x_label, y = !!sym(y_var), fill = Type)) +
    geom_bar(stat = "identity", width = 0.5, color = "white", linewidth = 1) +
    geom_text(aes(y = y_mid, 
                  label = ifelse(show_label, sprintf("%.1f%%", !!sym(y_var)), "")),
              size = 4, 
              fontface = "bold", 
              color = "white") +
    scale_fill_manual(values = colors) +
    labs(title = title, subtitle = subtitle, x = NULL, y = "Percentage (%)") +
    theme_minimal(base_size = 12) +
    theme(
      legend.position = "none",
      plot.title = element_text(hjust = 0.5, face = "bold", size = 12, margin = margin(b = 2)),
      plot.subtitle = element_text(hjust = 0.5, size = 10, color = "gray50", margin = margin(b = 5)),
      axis.text.x = element_text(size = 11, face = "bold"),
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = margin(t = 30, r = 10, b = 30, l = 10)
    ) +
    coord_flip() +
    ylim(0, 100)
  
  return(p)
}

# Create all four plots
gene_count_stack <- create_stacked_bar(
  data = gene_stack,
  x_label = "Genes",
  title = "Gene Types",
  subtitle = "Count Distribution",
  colors = gene_colors,
  y_var = "Count_Pct"
)

gene_length_stack <- create_stacked_bar(
  data = gene_stack,
  x_label = "Genes",
  title = "Gene Types",
  subtitle = "Length Distribution",
  colors = gene_colors,
  y_var = "Length_Pct"
)

transcript_count_stack <- create_stacked_bar(
  data = transcript_stack,
  x_label = "RNA Transcripts",
  title = "RNA Transcripts",
  subtitle = "Count Distribution",
  colors = transcript_colors,
  y_var = "Count_Pct"
)

transcript_length_stack <- create_stacked_bar(
  data = transcript_stack,
  x_label = "RNA Transcripts",
  title = "RNA Transcripts",
  subtitle = "Length Distribution",
  colors = transcript_colors,
  y_var = "Length_Pct"
)

# Extract legend for Gene Types
gene_legend_plot <- ggplot(gene_stack, aes(x = "Genes", y = Count_Pct, fill = Type)) +
  geom_bar(stat = "identity", width = 0.5) +
  scale_fill_manual(values = gene_colors, name = "Gene Types") +
  theme_void() +
  theme(
    legend.position = "bottom",
    legend.title = element_text(face = "bold", size = 10),
    legend.text = element_text(size = 8),
    legend.key.size = unit(0.4, "cm"),
    legend.margin = margin(t = 0, b = 0)
  )

# Extract legend for Transcript Types
transcript_legend_plot <- ggplot(transcript_stack, aes(x = "RNA Transcripts", y = Count_Pct, fill = Type)) +
  geom_bar(stat = "identity", width = 0.5) +
  scale_fill_manual(values = transcript_colors, name = "Transcript Types") +
  theme_void() +
  theme(
    legend.position = "bottom",
    legend.title = element_text(face = "bold", size = 10),
    legend.text = element_text(size = 8),
    legend.key.size = unit(0.4, "cm"),
    legend.margin = margin(t = 0, b = 0)
  )

gene_legend <- cowplot::get_legend(gene_legend_plot)
transcript_legend <- cowplot::get_legend(transcript_legend_plot)

# Combine legends side by side
combined_legend <- grid.arrange(gene_legend, transcript_legend, ncol = 2, widths = c(1, 1))

# Create final combined image
png("genome_annotation_stacked.png", width = 14, height = 10.5, units = "in", res = 300)

combined <- grid.arrange(
  arrangeGrob(gene_count_stack, gene_length_stack, ncol = 2, widths = c(1, 1)),
  arrangeGrob(transcript_count_stack, transcript_length_stack, ncol = 2, widths = c(1, 1)),
  combined_legend,
  nrow = 3,
  heights = c(0.7, 0.7, 0.2),
  top = textGrob("Genome Annotation Composition Analysis", 
                 gp = gpar(fontsize = 16, fontface = "bold"),
                 vjust = 1)
)

dev.off()

cat("\n========================================\n")
cat("Visualization complete!\n")
cat("========================================\n\n")
cat("Generated file: genome_annotation_stacked.png\n")