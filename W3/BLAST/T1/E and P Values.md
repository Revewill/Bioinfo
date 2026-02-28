# I. Practical Meaning of E-Value
> E-value represents the **number of matches** you would expect to see **by chance** that have a score equal to or better than the current match. It is calculated by combining the *alignment score* with *the size of the database*.

### 1. What the E-Value Number Means
* **Smaller E-value**
    > Closer to `0`.
    * This means it's highly **unlikely** that the match occurred by **random** chance. 
        * In practice, this indicates a very **high probability of a _true homologous relationship_** between the query and target sequence.
        > *e.g.*, an E-value less than `1×10⁻⁵` is considered **reliable evidence of _homology_**.
* Larger E-value (e.g., greater than 0.01 or 0.1): This suggests the match could easily be due to random similarity, especially with short sequences or low-complexity regions. In practice, such matches often need further verification using other information like alignment length and coverage.

### 2. How E-Value Affects Your Results
You can control the number and reliability of your results by adjusting the Expected threshold in the BLAST parameters:

Setting a low E-value threshold (e.g., 0.001): This will reduce the number of matches in your output, but the remaining sequences will be highly reliable. This is suitable for finding orthologs or highly conserved sequences.

Setting a high E-value threshold (e.g., 10): This will return more matches, but it will also include many false positives (random matches). This is useful for exploring distant homology or quickly screening for potential similarities.

In your experiment, setting the threshold to 0.5 yielded only one match. This means that, within the mouse protein database at this significance level, only one sequence was considered sufficiently reliable. The E-values for all other sequences were greater than 0.5.

II. Practical Meaning of P-Value
The P-value represents the probability that the observed match score could occur by chance under a random model. It describes the statistical significance of a single alignment.

1. Relationship Between P-Value and E-Value
While related, there's a crucial difference in the context of a database search:

P-value considers only a single alignment, i.e., the probability of this specific match happening by chance.

E-value accounts for the overall size of the database. It's essentially the P-value multiplied by the database size (or search space).

2. How It's Used in Practice
In actual BLAST output, you should primarily rely on the E-value, not the P-value. Here's why:

A database search involves millions of comparisons. If you only look at the P-value without considering the number of searches, you could easily mistake a random match for a significant result.

The E-value already includes a correction for multiple comparisons, making it a more realistic measure of significance in a database search context.

For example, a match might have a P-value of 1×10⁻⁶, which seems highly significant. But if the database contains 10⁶ sequences, its E-value could be close to 1. This means you'd expect to see one such match by chance, significantly reducing its apparent significance.

