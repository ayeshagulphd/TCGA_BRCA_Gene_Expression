# My TCGA-BRCA Gene Expression Analysis - R Code

# This script will performs RNA-seq expression analysis for BRCA2, TP53, and AR genes from the TCGA-BRCA dataset using RStudio.

## Now Step 1 Setup and Library Loading

r
setwd("D:/TCGA_BRCA_Project")

# Now Install the missing packages
packages <- c("readr", "dplyr", "ggplot2", "pheatmap", "org.Hs.eg.db", "AnnotationDbi", "gridExtra")
lapply(packages, function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
})

# Load libraries
library(readr)
library(dplyr)
library(ggplot2)
library(pheatmap)
library(org.Hs.eg.db)
library(AnnotationDbi)
library(gridExtra)


## Step 2: Load Expression Data


expression_data <- read_tsv("data/TCGA-BRCA.star_counts.tsv")


## Step 3: Now lets Clean Ensembl IDs and Prepare Matrix


expression_data$Ensembl_ID <- sub("\\..*", "", expression_data$Ensembl_ID)
expression_data <- expression_data[!duplicated(expression_data$Ensembl_ID), ]
rownames(expression_data) <- expression_data$Ensembl_ID
expression_data <- expression_data[, -1]


## Step 4: Now lets Analyze and Plot Selected Genes

# Target genes
genes <- c("BRCA2", "TP53", "AR")

# Map symbols to Ensembl
gene_map <- AnnotationDbi::select(org.Hs.eg.db,
                                  keys = genes,
                                  keytype = "SYMBOL",
                                  columns = c("ENSEMBL", "SYMBOL"))
gene_map <- gene_map[gene_map$ENSEMBL %in% rownames(expression_data), ]

# Subset and rename
selected_expression <- expression_data[gene_map$ENSEMBL, ]
rownames(selected_expression) <- gene_map$SYMBOL

# Barplot of average expression
avg_expr <- rowMeans(selected_expression)
df_plot <- data.frame(Gene = names(avg_expr), TPM = avg_expr)

# Plot & save
if (!dir.exists("plot")) dir.create("plot")
png("plot/BRCA2_TP53_AR_expression.png", width = 800, height = 600)
ggplot(df_plot, aes(x = Gene, y = TPM)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Average Expression of BRCA2, TP53, AR", y = "Mean TPM")
dev.off()


## Step 5: Generate Heatmap


png("plot/BRCA2_TP53_AR_heatmap.png", width = 800, height = 600)
pheatmap(as.matrix(selected_expression),
         main = "Expression Heatmap: BRCA2, TP53, AR",
         color = colorRampPalette(c("blue", "white", "red"))(100),
         fontsize_row = 12,
         fontsize_col = 4,
         cluster_cols = TRUE)
dev.off()


## Step 6: Clinical Action Summary PDF


clinical_text <- paste(
  "Clinical Action Plan\n\n",
  "BRCA2:\n",
  "[X] Screen all breast cancer patients for BRCA2 mutations\n",
  "[X] Prescribe Olaparib for eligible cases (HR+/HER2-)\n",
  "[X] Refer to trial: KEYLYNK-009\n\n",
  "TP53:\n",
  "[X] Flag TP53 mutations in pathology reports\n",
  "[X] Contact research coordinator for APR-246 trial\n\n",
  "AR:\n",
  "[X] Confirm androgen receptor status in prostate biopsies\n",
  "[X] Enroll mCRPC patients in ARV-110 trial"
)

# Save to PDF
if (!dir.exists("report")) dir.create("report")
text_grob <- grid::textGrob(clinical_text, gp = grid::gpar(fontsize = 12), just = "left")
plot_grob <- grid::rasterGrob(as.raster(png::readPNG("plot/BRCA2_TP53_AR_expression.png")))

pdf("report/Final_TCGA_BRCA_Report.pdf", width = 8.5, height = 11)
grid.arrange(text_grob, plot_grob, ncol = 1, heights = c(2, 3))
dev.off()
``





