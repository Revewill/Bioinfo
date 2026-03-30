# Alternative Splicing
> An answer `md` file for Bioinformatics_Homework_RNA_regulation_Alternative_Splicing

> Direct to [T1](#t1), [T2](#t2) quickly here.
---
### T1
> Hunting differential alternative splicing genes in given samples

* Created [`bash` script](./Script/alt-spl.sh) for analysis
  
    ```bash
    #!/bin/bash
    # This is a bash script for alternative splicing
    # How to run this script: ./alt-spl.sh file_for_input/b1 file_for_input/b2 gtf_file

    sep=$(echo "---------------------------------------------------------")
    rmats_py=$(which rmats.py)

    echo "$1" > "b1.txt"
    echo "$2" > "b2.txt"

    b1_len=$(samtools view $1 | cut -f 10 | perl -ne 'chomp;print length($_) . "\n"' | sort | uniq)
    b2_len=$(samtools view $2 | cut -f 10 | perl -ne 'chomp;print length($_) . "\n"' | sort | uniq)

    echo -e "$sep\nInput b1 file:\nFile name: $1\nRead lengths: $b1_len"
    echo -e "$sep\nInput b2 file:\nFile name: $2\nRead lengths: $b2_len"
    echo -e "$sep\nReference genome file:\nFile name: $3"

    if [ "$b1_len" == "$b2_len" ]; then

        echo -e "$sep\nRead lengths of input files are identical.\nBeginning Analysis..."

        mkdir -p output
        mkdir -p tmp

        python3 "${rmats_py}" \
        --b1 b1.txt --b2 b2.txt --gtf "$3" \
        --od output --tmp tmp \
        -t paired \
        --readLength $b1_len

        rm -rf tmp
        
        mkdir -p Results
        find output -name "*.MATS.JCEC.txt" -exec cp {} Results/ \;

        echo -e "Analysis completed.\nAll results are stored in directory "output".\nExiting program now."
    else
        echo -e "$sep\nThe read lengths of input files are not identical.\nPlease enter valid files for analysis!"
    fi

    rm b[0-9].txt
    ```

* Check result files ending in `.MATS.JCEC.txt` [here](./Results/)
---
### T2
> Mathematical processing of `PSI` in `rMATS`

* `PSI` (percentage spliced in), or $\psi$, is the estimated proportion of transcripts containing an exon in all transcripts
* 2 types of isoforms
  * Exon inclusion isoform
  * Exon skipping isoform
* `rMATS` integrates both **hierarchical model** and **likelihood-ratio test** to do this
  * **Hierarchical Model**
    > 2 layers for 2 types of uncertainty
    * Layer 1
      * Accounts for $\psi$ uncertainty due to **sequencing depth**
      * The count of reads supporting exon inclusion isoform is modeled as a **binomial** variable
          > $I$: reads supporting exon inclusion;
          > $S$: reads supporting exon skipping;
          > $\psi$: `PSI` level for a replicate;
          > $l_I$: effective length of inclusion isoform;
          > $l_S$: effective length of skipping isoform.

        * The observed $\psi$ level is

            $$
            \psi_{\text{obs}} = \frac{I}{I + S}
            $$

        * A function $f$ is defined to correct the $\psi$ value based on effective lengths

            $$
            f(\psi) = \frac{l_I\psi}{l_I\psi + l_S(1-\psi)}
            $$
        
        * The actual estimated $\psi$ level is the solve for equation $f(\psi)=\psi_{\text{obs}}$, denoted as $\hat\psi$

            $$
            \hat\psi = \frac{l_SI}{l_SI+l_IS}
            $$

        * Account for sequencing depth via bionomial modeling

            $$
            I | \psi \sim \text{Binomial}(n=I+S, p=f(\psi))
            $$

    * Layer 2
      * Accounts for $\psi$ uncertainty due to **variabilities within the same group**
      * The logit-transformed $\psi$ levels across replicates within the same groups are modeled as a **normal** variable
        > $\psi_{ijk}$: the estimated $\psi$ level for exon $i$, group $j$, replicate $k$;
        > $\psi_{ij}$: group mean for exon $i$, group $j$;
        > $\sigma_{ij}$: group variance for exon $i$, group $j$;
        > $\text{logit}(x)=\ln(x/(1-x))$.

        * Estimate the `logit` of $\psi_{ijk}$

            $$
            \text{logit}(\psi_{ijk}) \sim \text{Normal}(\mu=\text{logit}(\psi_{ij}), \sigma^2=\sigma_{ij}^2)
            $$
  * **Likelihood-ratio test**
    * Hypotheses
      * User-defined threshold $c$
      * Null hypothesis

        $$
        H_0 : |\psi_1-\psi_2| \le c
        $$

      * Alternative hypothesis

        $$
        H_1 : |\psi_1-\psi_2| > c
        $$

    * Do test
      * Computes `p-value` to assess statistical significance