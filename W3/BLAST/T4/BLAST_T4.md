# Discussion on the Symmetry of `PAM250` matrix
> [Click here](https://en.wikipedia.org/wiki/Point_accepted_mutation#An_example_-_PAM250) for **symmetric** `PAM250` sample; [Click here](http://www.deduveinstitute.be/~opperd/private/pam250.html) for **asymmetric** `PAM250` sample.

## 1. Reasons why symmetry differs
* The **asymmetric** `PAM250` matrix is actually an **observed mutation count matrix**.
    * Such matrix differs from **`log-odds` scoring matrices**.
    * Its entries $Count(i,j)$ represents the **actual counts** of one amino acid substituted by another **via mutation**.
        > *e.g.*, $Count(i,j)=$ The observed times of mutation from the $i$ th amino acid to the $j$ th within the alignment results of highly homologues sequences used to construct `PAM` matrices.
        * Suggests that $Count(i,j)$ is a **nonnegative integer**, an observed data.
    * The asymmetry of this matrix directly results from both **the asymmetry of nucleotide mutation** and **the varied frequency** of different amino acids.
* The **symmetric** `PAM250` matrix is the actual `PAM250` matrix used in `BLAST` analysis.
    * Its entries $PAM_{250}(i,j)$ represents the score of the $i$ th amino acid aligning to the $j$ th.
        > A score, in general terms, means reliability.
    * Since **alignment is a symmetric process** *(the similarity between two sequences should not depend on who's query and who's subject)*, these entries are **mathematically processed to be symmetric** as well ($PAM_{250}(i,j)=PAM_{250}(j,i)$).

## 2. Differences in terms of practical usage
* Main usage of **asymmetric** `PAM250` matrix
    * Used to generate **symmetric** `PAM250` matrix.
    * Raw data for algorithm developers.
    * Compiles statistics on alignment.
* Main usage of **symmetric** `PAM250` matrix
    * `BLAST` and other alignment algorithms.
    * Reflects evolutionary relationships.