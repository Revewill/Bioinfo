# [Pinpointing Intron Intervals](#1-pinpointing-intron-intervals) and [Isolating Mappings onto Introns](#2-isolating-mappings-onto-introns)
> A README `md` file for Bioinformatics_Homework_Mapping_bedtools_and_samtools_T3
---
### 1. Pinpointing Intron Intervals
#### 1.1 Create [`bash` script](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Script/ACTB_intron_intervals_bed.sh)
> Click to [skip the script](#12-run-script-and-check)
* Script [ACTB_intron_intervals_bed.sh](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Script/ACTB_intron_intervals_bed.sh)
    ```bash
    #!/bin/bash
    # This script finds all intron intervals in ACTB gene.
    gff="hg38.ACTB.gff"

    # Export to files
    > .tmp.gene.bed
    > .tmp.exon.bed
    > .sort.gene.bed
    > .sort.exon.bed
    while read line; do
        type=$(echo "${line}" | awk '{print $3}')
        if [ "${type}" = "gene" ]; then
            a=$(echo "${line}" | awk '{print $1"\t"$4-1"\t"$5}')
            b=$(echo "${line}" | awk '{print $9}' | sed -n 's/.*ID=\([^;]*\).*/\1/p')
            c=$(echo "${line}" | awk '{print $6"\t"$7}')
            echo -e "${a}\t${b}\t${c}" >> .tmp.gene.bed
        elif [ "${type}" = "exon" ]; then
            a=$(echo "${line}" | awk '{print $1"\t"$4-1"\t"$5}')
            b=$(echo "${line}" | awk '{print $9}' | sed -n 's/.*ID=\([^;]*\).*/\1/p')
            c=$(echo "${line}" | awk '{print $6"\t"$7}')
            echo -e "${a}\t${b}\t${c}" >> .tmp.exon.bed
        fi
    done < "${gff}"

    # Bedtools subtract: find introns
    sort -k1,1 -k2,2n .tmp.gene.bed > .sort.gene.bed
    sort -k1,1 -k2,2n .tmp.exon.bed > .sort.exon.bed
    bedtools subtract -s -a .sort.gene.bed -b .sort.exon.bed > ACTB_intron_intervals.bed

    rm \.[a-z]*.bed
    ```
#### 1.2 Run [script](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Script/ACTB_intron_intervals_bed.sh) and check [result](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Results/ACTB_intron_intervals.bed)
* Run [script](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Script/ACTB_intron_intervals_bed.sh)

  ```bash
  $ bash ACTB_intron_intervals_bed.sh
  ```
* Check [result](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Results/ACTB_intron_intervals.bed)
  * Click to download `bed` file [ACTB_introns_intervals.bed](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Results/ACTB_intron_intervals.bed)
  * Or view it here (Click to [skip](#2-isolating-mappings-onto-introns))
    ```
    chr7	5528185	5528280	ENSG00000075624.17	.	-
    chr7	5529982	5530523	ENSG00000075624.17	.	-
    chr7	5530627	5540675	ENSG00000075624.17	.	-
    chr7	5540771	5561851	ENSG00000075624.17	.	-
    chr7	5561949	5562389	ENSG00000075624.17	.	-
    chr7	5562828	5563713	ENSG00000075624.17	.	-
    ```
### 2. Isolating Mappings onto Introns
#### 2.1 Run command
```bash
$ $ bedtools intersect -a COAD.ACTB.bam -b ACTB_intron_intervals.bed -u > COAD.ACTB.intron.bam \
$ && samtools fastq COAD.ACTB.intron.bam > COAD_ACTB_intron.fastq
# Returns
[M::bam2fq_mainloop] discarded 0 singletons
[M::bam2fq_mainloop] processed 15132 reads
```
#### 2.2 Check [result](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Results/COAD_ACTB_intron.fastq)
* Click to download `fastq` file [COAD_ACTB_intron.fastq](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T3/Results/COAD_ACTB_intron.fastq)
