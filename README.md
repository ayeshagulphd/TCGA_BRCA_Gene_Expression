[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15863921.svg)](https://doi.org/10.5281/zenodo.15863921)

TCGA-BRCA Gene Expression Analysis

A comprehensive gene expression analysis of BRCA2, TP53, and AR using RNA-Seq data from The Cancer Genome Atlas (TCGA) Breast Invasive Carcinoma (BRCA) cohort. This project was completed using RStudio, Bioconductor, and open-source tools to explore expression patterns and generate clinical insights.

The Summary of my project
Dataset: 
TCGA-BRCA.star_counts.tsv (STAR-aligned gene expression counts)
Source: 
UCSC Xena Browser https://xenabrowser.net
Genes of Interest: 
BRCA2, TP53, AR
Tools Used: 
R 4.5.1, RStudio, Bioconductor (org.Hs.eg.db, ggplot2, pheatmap)
Outputs: 
Heatmap, Barplot, Clinical Action Report (PDF)

My Key Analyses of this Project
Cleaned and filtered TCGA Ensembl gene IDs
Mapped gene symbols using org.Hs.eg.db
Subset expression matrix to selected genes
Visualized average expression (barplot)
Visualized expression across patients (heatmap)
Created PDF clinical action plan report

Folder Structure
TCGA_BRCA_Gene_Analysis/
├── data/ # TCGA expression data (not uploaded, instructions below)
├── scripts/ # All R scripts used in the project
├── plot/ # Generated images (heatmap, barplot)
├── report/ # Final PDF summary
└── README.md # Project overview (this file)

Visual Output
Gene Expression Barplot
Shows average TPM values for BRCA2, TP53, AR.

Expression Heatmap
Shows sample-level variability in gene expression for all 3 genes, clustered by patient.

Clinical Action Highlights
[X] BRCA2 → Screen all breast cancer patients for BRCA2 mutations  
       Prescribe Olaparib for eligible cases (HR+/HER2-)  
       Refer to clinical trial: KEYLYNK-009  

[X] TP53   Flag TP53 mutations in pathology reports  
                   Contact research coordinator for APR-246 trial  

[X] AR (Androgen Receptor) Confirm AR status in biopsy reports  
           Enroll patients in ARV-110 or similar trial (mCRPC or TNBC context)

How to Reproduce
Download TCGA BRCA STAR count matrix from UCSC Xena: [https://xenabrowser.net/datapages/?dataset=TCGA.BRCA.sampleMap/HiSeqV2](https://xenabrowser.net/datapages/?dataset=TCGA.BRCA.sampleMap/HiSeqV2)
Place file in `data/` folder as `TCGA-BRCA.star_counts.tsv`
Run scripts in order from `scripts/`
Output files will be generated in `plot/` and `report/`

Author
Ayesha Gul Phd Student Independent Genomics Data Analyst  
Pakistan  Open to opportunities globally

Citation / Reference
Ayesha D. (2025). *TCGA-BRCA Gene Expression Analysis: BRCA2, TP53, AR*. GitHub Repository.  
Zenodo DOI Pending

License
MIT License Free to use with attribution.
This project is part of my professional portfolio to demonstrate bioinformatics analysis using RStudio and TCGA data.*
