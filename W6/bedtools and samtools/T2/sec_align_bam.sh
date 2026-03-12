#!/bin/bash
echo -e 'This script greps all secondary alignment records in COAD.ACTB.bam\nAnalyze now ...'
total=$(samtools view /home/test/mapping/bedtools_samtools/homework/COAD.ACTB.bam | wc -l)
sec=$(samtools view -f 256 /home/test/mapping/bedtools_samtools/homework/COAD.ACTB.bam | wc -l)
prop=$((100 * $sec / $total)).$(( (10000 * $sec / $total) % 100 ))
echo -e "The total record count is $total.\nThere are $sec secondary alignment records in the file, taking $prop% in all records."