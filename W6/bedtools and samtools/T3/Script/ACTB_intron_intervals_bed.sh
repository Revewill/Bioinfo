#!/bin/bash
# This script finds all intron intervals in ACTB gene.
gff="hg38.ACTB.gff"

# Export to files
> .tmp.gene.bed
> .tmp.exon.bed
> .sort.gene.bed
> .sort.exon.bed
while read line; do
    type=$(echo "${line}" | awk '{print $3}')
    if [ "${type}" = "gene" ]; then
        a=$(echo "${line}" | awk '{print $1"\t"$4-1"\t"$5}')
        b=$(echo "${line}" | awk '{print $9}' | sed -n 's/.*ID=\([^;]*\).*/\1/p')
        c=$(echo "${line}" | awk '{print $6"\t"$7}')
        echo -e "${a}\t${b}\t${c}" >> .tmp.gene.bed
    elif [ "${type}" = "exon" ]; then
        a=$(echo "${line}" | awk '{print $1"\t"$4-1"\t"$5}')
        b=$(echo "${line}" | awk '{print $9}' | sed -n 's/.*ID=\([^;]*\).*/\1/p')
        c=$(echo "${line}" | awk '{print $6"\t"$7}')
        echo -e "${a}\t${b}\t${c}" >> .tmp.exon.bed
    fi
done < "${gff}"

# Bedtools subtract: find introns
sort -k1,1 -k2,2n .tmp.gene.bed > .sort.gene.bed
sort -k1,1 -k2,2n .tmp.exon.bed > .sort.exon.bed
bedtools subtract -s -a .sort.gene.bed -b .sort.exon.bed > ACTB_intron_intervals.bed

rm \.[a-z]*.bed