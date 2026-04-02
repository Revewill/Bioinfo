# Ribo-seq
> An answer `md` file for Bioinformatics_Homework_RNA_regulation_Ribo-seq

> Direct to [T1](#t1), [T2](#t2), [T3](#t3), [T4](#t4) quickly here.
---
### T1
> TE explained

* TE, Translation Efficiency

---
### T2
> TE calculation and distribution by `RiboWave`
##### 2.1 **TE calculation**
* Load from file and run docker container
  * same step required in [T3](#t3)
  * Run in `Terminal`

    ```powershell
    PS> docker load -i ~/Desktop/bioinfo_tsinghua_6.2_apa_6.3_ribo_6.4_structure.tar.gz
    # Returns
    Loaded image: xfliu1995/bioinfo_tsinghua_6.2_apa_6.3_ribo_6.4_structure:v1

    PS> docker run --name=rnaregulation \
    -dt -h bioinfo_docker --restart unless-stopped \
    -v ~/Desktop/Bioinfo_THU/share_docker:/home/test/share \
    xfliu1995/bioinfo_tsinghua_6.2_apa_6.3_ribo_6.4_structure:v1
    # Returns
    10e225b9affd29aa5952f119f8146000493b86e5bf3a80290a0aad468d99249c

    PS> docker exec -u root -it rnaregulation bash
    ```
* Go to working dir
  ```bash
  cd /home/test/rna_regulation/ribo-wave
  ```
* Create [`bash` script](./T2.RiboWave/Script/scr.sh)

    ```bash
    mkdir -p /home/test/rna_regulation/ribo-wave/GSE52799/Ribowave

    # RPKM file
    RPKM="GSE52799/mRNA/SRR1039761.RPKM"

    read -t 60 -p "Do you want to use filtered mRNA RPKM data? [y/n]: " answer
    if [[ ${answer,,} == "y" ]]; then
            # Filter
            awk '$2 > 0{print $0}' "${RPKM}" > GSE52799/mRNA/SRR1039761.filtered.RPKM
            filtered="GSE52799/mRNA/SRR1039761.RPKM"

            # Run Ribowave
            script/Ribowave \
            -T 9012445  "${filtered}" \
            -a GSE52799/bedgraph/SRR1039770/final.psite \
            -b annotation_fly/final.ORFs \
            -o GSE52799/Ribowave \
            -n SRR1039770.filtered \
            -s script \
            -p 8
    elif [[ ${answer,,} == "n" ]]; then
            # Run Ribowave
            script/Ribowave \
            -T 9012445  "${RPKM}" \
            -a GSE2799/bedgraph/SRR1039770/final.psite \
            -b annotation_fly/final.ORFs \
            -o GSE52799/Ribowave \
            -n SRR1039770 \
            -s script \
            -p 8
    else
            echo "Exiting now."
    fi
    ```
* Run [script](./T2.RiboWave/Script/scr.sh)

    ```bash
    chmod 775 scr.sh
    ./scr.sh
    ```
* Check [unfiltered result](./T2.RiboWave/Results/SRR1039770.TE) or [filtered result](./T2.RiboWave/Results/SRR1039770.filtered.TE)
##### 2.2 **TE distribution visualized via `R`**
* Create [`R` script](./T2.RiboWave/Script/scr.R) for density plotting

    ```R
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
    ```
* Check result in `png`, [unfiltered](./T2.RiboWave/Results/TE_density.png) or [filtered](./T2.RiboWave/Results/TE_density.filtered.png)
![TEdist](./T2.RiboWave/Results/TE_density.png)
    * Main peak at approximately -2
    * Indicates that most TE values are clustered around 0.25

* The 2 plots are in fact identical, because trimming all `RPKM=0` rows in mRNA RPKM file is equivalent with trimming all `Inf` values in `TE` files; yet the RPKM threshold is user-defined, and that might be of significance in practice.

    ```bash
    $ diff GSE52799/Ribowave/SRR1039770.TE GSE52799/Ribowave/SRR1039770.filtered.TE | \
    > awk '{print $4}' | sort | uniq -c
    # Returns
        562
    13563 Inf
    ```
---
### T3
> Use `RiboCode` for P-site and ORF prediction
##### 3.1 **P-site**
* Enter container, create [`bash` script](./T3.RiboCode/Script/scr.P-site.sh) and run

    ```bash
    RiboCode_annot=/home/test/rna_regulation/ribo-code/RiboCode_annot
    OUT=/home/test/rna_regulation/ribo-code/wtuvb2/
    mkdir -p ${OUT}
    mkdir -p ${OUT}/metaplots

    /home/test/software/miniconda3/bin/metaplots -a ${RiboCode_annot} \
    -r /home/test/rna_regulation/ribo-code/wtuvb2/wtuvb2.Aligned.toTranscriptome.out.sorted.bam \
    -o ${OUT}/metaplots/wtuvb2. \
    -m 26 -M 50 -s yes -pv1 1 -pv2 1
    ```
* Acquire result in [`pdf`](./T3.RiboCode/Results/P-site/wtuvb2.wtuvb2.Aligned.toTranscriptome.out.sorted.pdf), [`jpeg`](./T3.RiboCode/Results/P-site/wtuvb2.wtuvb2.Aligned.toTranscriptome.out.sorted.jpeg) and [`txt`](./T3.RiboCode/Results/P-site/wtuvb2._pre_config.txt)
![P-site](./T3.RiboCode/Results/P-site/wtuvb2.wtuvb2.Aligned.toTranscriptome.out.sorted.jpeg)
##### 3.2 **ORF count**
* Create [`bash` script](./T3.RiboCode/Script/scr.ORF-count.sh) and run

    ```bash
    RiboCode_annot=/home/test/rna_regulation/ribo-code/RiboCode_annot
    OUT=/home/test/rna_regulation/ribo-code/wtuvb2/
    config=${OUT}/metaplots/wtuvb2._pre_config.txt
    mkdir -p ${OUT}/ORF_count
    /home/test/software/miniconda3/bin/ORFcount -g ${OUT}/ORF/ORF.gtf \
    -r ${OUT}/wtuvb2.Aligned.sortedByCoord.out.bam \
    -f 15 -l 5 -e 100 -m 24 -M 35 -s yes \
    -o ${OUT}/ORF_count/data_all.txt
    ```
* View results here
    [ORF-count](./T3.RiboCode/Results/ORF-count/)
    ├── [ORF_collapsed.gtf](./T3.RiboCode/Results/ORF-count/ORF_collapsed.gtf)
    ├── [ORF_collapsed.txt](./T3.RiboCode/Results/ORF-count/ORF_collapsed.txt)
    ├── [ORF_ORFs_category.pdf](./T3.RiboCode/Results/ORF-count/ORF_ORFs_category.pdf)
    ├── [ORF.gtf](./T3.RiboCode/Results/ORF-count/ORF.gtf)
    └── [ORF.txt](./T3.RiboCode/Results/ORF-count/ORF.txt)

---
### T4
> Differential TE calculation and plotting via `Xtail` in `R`
---