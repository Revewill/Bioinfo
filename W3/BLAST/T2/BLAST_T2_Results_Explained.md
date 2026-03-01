# Explanation on `BLAST` (T2) results
> [Click here](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Results.txt) for *final results*;
> [Click here](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Script.sh) for *original script*;
> [Click here](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Shuffled_Sequences.fasta) for *shuffled sequence data* in `FASTA` format.

## 1. Format for [final results](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Results.txt)
* *Abbr.* meanings: (in `-outfmt 6` format)

| Col. | *Abbr.*         | Meanings           |
| :---: | :-----------: |:-------------:|
| **1** | **`qseqid`**     | **Query sequence ID** |
| **2** | **`sseqid`**     | **Subject sequence ID**      |
| **3** | **`pident`** | **Percentage of identical matches (*sequence identity*)**      |
| 4 | `length` | Length of the alignment (*number of amino acids*)      |
| 5 | `mismatch` | Number of mismatched amino acids      |
| 6 | `gapopen` | Number of gap openings      |
| 7 | `qstart` | **Start** of the alignment in the **query** sequence      |
| 8 | `qend` | **End** of the alignment in the **query** sequence      |
| 9 | `sstart` | **Start** of the alignment in the **subject** sequence      |
| 10 | `send` | **End** of the alignment in the **subject** sequence      |
| **11** | **`evalue`** | **Expectation value (`E-value`)**      |
| **12** | **`bitscore`** | **Bit score (*higher indicates a better match*)**      |

* The end of [final results](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Results.txt) includes [the ten shuffled sequences in `FASTA` format](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Shuffled_Sequences.fasta) for easy reference.

## 2. General Interpretation of [Result Data](https://revewill.github.io/Bioinfo.Revewill.github.io/W3/BLAST/T2/BLAST_T2_Results.txt)
* **Alignment Coverage**
    * The lengths of alignments are **significantly shorter** than the full length of the sequences.
        > Average alignment length `12.02` *amino acids*;
        > Shuffled sequence length `70.00` *amino acids*.
    * Indicates that shuffled sequences share little homology (demonstrates randomness).
* **Identity**
    * Most alignments show identity between `40%` and `80%`.
        > Some reach `100%` identity (*e.g.*, a `4` *amino acids* segment between `shuffled_seq_1` and `shuffled_seq_10`)
    * Short alignment lengths indicates that high identity is likely just a **random coincidence**.

* **`E-value` Distribution**
    * Scattered distribution.
        > Some `E-values` are less than `0.05` (*e.g.*, `shuffled_seq_2` & `shuffled_seq_7` with `E=0.18`, `shuffled_seq_6` & `shuffled_seq_10` with `E=0.10`).

        > Most `E-values` fall between `1` and `100`, or are even larger (*e.g.*, `E=575`).

* **Symmetry**
    * The results are not symmetrical.
        > *e.g.*, alignment parameters of `shuffled_seq_1` & `shuffled_seq_7` **differ slightly** from `shuffled_seq_7` & `shuffled_seq_1`.
    * `BLAST` performs **local** alignments; aligning in one direction versus the reverse might identify **different optimal matching regions**.

## 3. Disscusion
* **False positives**
    * Short, Random Similarities
        * Two randomly shuffled sequences might **locally** contain an identical short segment by chance
            > *e.g.*, `4` *amino acids*
            
            * `BLAST` might assign a seemingly significant `E-value` (like `0.1`).
        * However, due to the extremely short **alignment length**, such a match has virtually **no biological meaning**.

* **Conclusion**
    * No true homologues relationships between shuffled sequences.
    * `BLAST`'s Performance on Random Data
        * This experiment demonstrates that `BLAST` will still produce significant alignments when searching against random sequences.
            > Specifically, with some `E-values` even below conventional significance thresholds
        * In real research, conclusions should never be based on `E-values` alone.
            > **Other information**, such as **alignment length**, **functional annotation**, and **species of origin**, must be considered as well.