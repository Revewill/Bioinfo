library(ggplot2)

# Extract raw TE data
te.tab <- read.table("SRR1039770.TE",
    header = TRUE, sep = "\t", stringsAsFactors = FALSE)
te.tab.f <- read.table("SRR1039770.filtered.TE",
    header = TRUE, sep = "\t", stringsAsFactors = FALSE)

# Filter
te.tab <- te.tab[
    !is.na(te.tab$TE) & !is.infinite(te.tab$TE) & !te.tab$TE == 0,
]
te.tab.f <- te.tab.f[
    !is.na(te.tab.f$TE) & !is.infinite(te.tab.f$TE) & !te.tab.f$TE == 0,
]

# Plot with ggplot2
ggplot(te.tab, aes(x = log2(TE))) +
  geom_density(fill = "steelblue", alpha = 0.6, color = "darkblue", linewidth = 1) +
  geom_vline(xintercept = log2(1), color = "yellow", linewidth = 0.5) +
  xlim(-9, 100) +
  labs(title = "Density distribution of TE",
       x = "log2(TE)",
       y = "Density") +
  theme_minimal()

ggsave("TE_density.png", width = 8, height = 6, dpi = 300)

ggplot(te.tab.f, aes(x = log2(TE))) +
  geom_density(fill = "steelblue", alpha = 0.6, color = "darkblue", linewidth = 1) +
  geom_vline(xintercept = log2(1), color = "yellow", linewidth = 0.5) +
  xlim(-9, 100) +
  labs(title = "Density distribution of TE (filtered)",
       x = "log2(TE)",
       y = "Density") +
  theme_minimal()

ggsave("TE_density.filtered.png", width = 8, height = 6, dpi = 300)