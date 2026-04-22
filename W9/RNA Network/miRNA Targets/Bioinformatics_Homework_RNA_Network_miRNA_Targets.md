# miRNA Targets
> An answer `md` file for Bioinformatics_Homework_RNA_Network_miRNA_Targets
 
---
* Downloaded `miRanda` via command
    ```bash
    $ mamba install -c bioconda miranda
    ```

* Run command and acquire [results](./Output/miRanda.output.txt)

    ```bash
    miranda miRNA.fa target.fa > miRanda.output.txt
    ```

    ```
    Read Sequence:hsa-miR-214-5p (22 nt)
    Read Sequence:target1 (216 nt)
    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    Performing Scan: hsa-miR-214-5p vs target1
    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    Score for this Scan:
    No Hits Found above Threshold
    Complete

    Read Sequence:target2 (1844 nt)
    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    Performing Scan: hsa-miR-214-5p vs target2
    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

    Forward:	Score: 150.000000  Q:2 to 21  R:1462 to 1482 Align Len (19) (63.16%) (78.95%)

    Query:    3' cgUGUCGUUCACAUCUGUCCGu 5'
                    ::||| :| |  ||||||| 
    Ref:      5' gaGTAGCTGG-GCTGACAGGCa 3'

    Energy:  -21.389999 kCal/Mol

    Scores for this hit:
    >hsa-miR-214-5p	target2	150.00	-21.39	2 21	1462 1482	19	63.16%	78.95%


    Forward:	Score: 140.000000  Q:3 to 13  R:453 to 474 Align Len (10) (100.00%) (100.00%)

    Query:    3' cgugucguucACAUCUGUCCgu 5'
                            ||||||||||  
    Ref:      5' tattatttttTGTAGACAGGgt 3'

    Energy:  -16.879999 kCal/Mol

    Scores for this hit:
    >hsa-miR-214-5p	target2	140.00	-16.88	3 13	453 474	10	100.00%	100.00%

    Score for this Scan:
    Seq1,Seq2,Tot Score,Tot Energy,Max Score,Max Energy,Strand,Len1,Len2,Positions
    >>hsa-miR-214-5p	target2	290.00	-38.27	150.00	-21.39	6	22	1844	 1462 453
    ```
---