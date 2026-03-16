# Expression Matrix
### T3

```bash
$ /usr/local/bin/infer_experiment.py \
> -r GTF/Arabidopsis_thaliana.TAIR10.34.bed \
> -i bam/Shape02.bam
# Returns
Reading reference gene model GTF/Arabidopsis_thaliana.TAIR10.34.bed ... Done
Loading SAM/BAM file ...  Total 200000 usable reads were sampled


This is PairEnd Data
Fraction of reads failed to determine: 0.0315
Fraction of reads explained by "1++,1--,2+-,2-+": 0.4769
Fraction of reads explained by "1+-,1-+,2++,2--": 0.4916
```

```bash
$ /home/software/subread-2.0.3-source/bin/featureCounts \
> -s 0 -p \
> -t exon \
> -g gene_id \
> -a GTF/Arabidopsis_thaliana.TAIR10.34.gtf 
> -o result/Shape02.featurecounts.exon.txt \
> bam/Shape02.bam
# Returns

        ==========     _____ _    _ ____  _____  ______          _____
        =====         / ____| |  | |  _ \|  __ \|  ____|   /\   |  __ \
          =====      | (___ | |  | | |_) | |__) | |__     /  \  | |  | |
            ====      \___ \| |  | |  _ <|  _  /|  __|   / /\ \ | |  | |
              ====    ____) | |__| | |_) | | \ \| |____ / ____ \| |__| |
        ==========   |_____/ \____/|____/|_|  \_\______/_/    \_\_____/
          v2.0.3

//========================== featureCounts setting ===========================\\
||                                                                            ||
||             Input files : 1 BAM file                                       ||
||                                                                            ||
||                           Shape02.bam                                      ||
||                                                                            ||
||             Output file : Shape02.featurecounts.exon.txt                   ||
||                 Summary : Shape02.featurecounts.exon.txt.summary           ||
||              Paired-end : yes                                              ||
||        Count read pairs : no                                               ||
||              Annotation : Arabidopsis_thaliana.TAIR10.34.gtf (GTF)         ||
||      Dir for temp files : result                                           ||
||                                                                            ||
||                 Threads : 1                                                ||
||                   Level : meta-feature level                               ||
||      Multimapping reads : not counted                                      ||
|| Multi-overlapping reads : not counted                                      ||
||   Min overlapping bases : 1                                                ||
||                                                                            ||
\\============================================================================//

//================================= Running ==================================\\
||                                                                            ||
|| Load annotation file Arabidopsis_thaliana.TAIR10.34.gtf ...                ||
||    Features : 313952                                                       ||
||    Meta-features : 32833                                                   ||
||    Chromosomes/contigs : 7                                                 ||
||                                                                            ||
|| Process BAM file Shape02.bam...                                            ||
||    Paired-end reads are included.                                          ||
||    The reads are assigned on the single-end mode.                          ||
||    Total alignments : 2730443                                              ||
||    Successfully assigned alignments : 2559170 (93.7%)                      ||
||    Running time : 0.08 minutes                                             ||
||                                                                            ||
|| Write the final count table.                                               ||
|| Write the read assignment summary.                                         ||
||                                                                            ||
|| Summary of counting results can be found in file "result/Shape02.featurec  ||
|| ounts.exon.txt.summary"                                                    ||
||                                                                            ||
\\============================================================================//

```

```bash
awk '$1 == "AT1G09530"{print $0}' result/Shape02.featurecounts.exon.txt \
> | awk '{print $NF}'
# Returns
86
```

[result file](https://revewill.github.io/Bioinfo.Revewill.github.io/W7/Expression%20Matrix/T3/Shape02.featurecounts.exon.txt) 