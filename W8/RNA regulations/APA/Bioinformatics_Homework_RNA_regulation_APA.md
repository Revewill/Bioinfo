# APA
> An answer `md` file for Bioinformatics_Homework_RNA_regulation_APA

> Direct to [T0](#t0), [T1](#t1), [T2](#t2) quickly here.
---
### T0
> Run test files and acquire result

* Run the following commands

    ```bash
    $ python3 /root/RNA.reg/dapars/src/DaPars_Extract_Anno.py \
    > -b hg19_refseq_whole_gene.bed \
    > -s hg19_4_19_2012_Refseq_id_from_UCSC.txt \
    > -o hg19_refseq_extracted_3UTR.bed
    ```

    ```bash
    $ python3 /root/RNA.reg/dapars/src/DaPars_main.py \
    > DaPars_test_data_configure.txt
    ```
* Check results [here](./Results/DaPars_Test_data_All_Prediction_Results.txt)
---
### T1
> `PDUI` explained

* `PDUI`, Percentage of Distal polyA site Usage Index
* Formula

    $$
    \text{PDUI} = \frac{\text{distal expression}}{\text{distal expression}+\text{proximal expression}}
    $$
  Apparently,

    $$
    \text{PDUI} \in [0,1]
    $$

* Biological idications
  * Greater `PDUI` value indicates greater usage of distal expression and *vice versa*
  * $\text{PDUI}=0$ suggests complete usage of proximal expression and $\text{PDUI}=1$ suggests the opposite; $\text{PDUI}=0.5$ suggests balanced usage
  * In comparison

    | `PDUI` | Indications |
    | :--- | :--- |
    | Increased significantly | More usage of distal expression, might include more regulation sites |
    | Decreased significantly | More usage of proximal expression, might include less regulation sites |
    | No significant change observed | No APA event |
---
### T2
> Filter results via different methods

* Create [`R` script](./Script/Script.R) for analysis

    ```R
    # Read from file and filter all invalid number
    raw.table <- read.table(
        "DaPars_Test_data_All_Prediction_Results.txt",
        stringsAsFactors = FALSE, header = TRUE, sep = "\t")

    nona.table <- na.omit(raw.table)

    # Filter data by different methods
    filtered.table1 <- nona.table[
        nona.table$adjusted.P_val <= 0.05 &
        nona.table$PDUI_Group_diff >= 0.5 &
        abs(log2(nona.table$Group_B_Mean_PDUI / nona.table$Group_A_Mean_PDUI)) >= 0.59
    ,]

    filtered.table2 <- nona.table[
        nona.table$Pass_Filter == "Y"
    ,]

    # View result
    n1 <- nrow(filtered.table1)
    n2 <- nrow(filtered.table2)
    n1in2 <- length(intersect(
        filtered.table1$Gene, filtered.table2$Gene
    ))

    cat("All genes selected via parameter filter: ", n1, "\n")
    cat("All genes selected via pass filter: ", n2, "\n")
    cat("Common genes selected: ", n1in2)
    ```
* Run [script](./Script/Script.R) and check output

    ```
    All genes selected via parameter filter: 12
    All genes selected via pass filter: 12
    Common genes selected: 12
    ```
* Conclusion: the two filtering methods are **equivalent** in outcome