# Structure Motif
> An answer `md` file for Bioinformatics_Homework_Motif_Structure_Motif

> Direct to [T1](#t1), [T2](#t2) quickly here.
---
### T1
> **BEAR encoder** explained

> Article: [A novel approach to represent and compare RNA secondary structures](https://doi.org/10.1093/nar/gku283)

* BEAR (Brand new alphabet for RNA) invents a delicate projection from RNA secondary structure motif information to linear character strings
* An extended alphabet that denotes secondary structure motifs including
  * Stems: regions with consistent pairing
  * Hairpin Loops: Single-chained loops at the distal of stems
  * Internal Loop: Unpaired loops within stems, double-sided
  * Bulges: Unpaired regions within stems, single-sided
  * Multibranch Loop: Intersecting loops of multiple stems
* Pipeline
  * Identify structure motifs
  * Determine for each motif its length and position
  * Project to characters
    * *e.g.*, `S1` → `a` (`S1` represents stem with length of `1` nc)
  * Acquire the character string and align

---
### T2
> Differences between **RNApromo** and **MEME**

> Article: [Computational prediction of RNA structural motifs involved in posttranscriptional regulatory processes](https://doi.org/10.1073/pnas.0803169105)
* Key comparisons

    | Comparison | **MEME** | **RNApromo** |
    | :--- | :--- |:--- |
    | Input | Primary sequence | Primary sequence + Secondary structure |
    | Objective | Sequence motifs | Structure motifs |
    | Inconsistent sites | Not allowed | Allowed |
    | Algorithm | EM (Expectation-Maximization algorithm) | SCFG (Stochastic Context-Free Grammar) |
    | Output | PWM (Position Weight Matrix) | Structure mode, including a motif's length range and conserved sequence |
---