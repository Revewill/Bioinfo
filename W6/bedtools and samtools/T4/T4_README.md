# Genome Coverage and Bedgraph
> A README `md` file for Bioinformatics_Homework_Mapping_bedtools_and_samtools_T4
---
* Run command to generate [`bedgraph` file](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T4/COAD.ACTB.cov.bedgraph)
  ```bash
    $ samtools sort COAD.ACTB.bam > sorted.COAD.ACTB.bam
    $ samtools index sorted.COAD.ACTB.bam
    $ bedtools genomecov -split -ibam sorted.COAD.ACTB.bam -bg > COAD.ACTB.cov.bedgraph
  ```
* Check [`bedgraph` file](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T4/COAD.ACTB.cov.bedgraph)
  * Click to download [COAD.ACTB.cov.bedgraph](https://revewill.github.io/Bioinfo.Revewill.github.io/W6/bedtools%20%and%20%samtools/T4/COAD.ACTB.cov.bedgraph)