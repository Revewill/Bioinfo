mkdir -p /home/test/rna_regulation/ribo-wave/GSE52799/Ribowave

# RPKM file
RPKM="GSE52799/mRNA/SRR1039761.RPKM"

read -t 60 -p "Do you want to use filtered mRNA RPKM data? [y/n]: " answer
if [[ ${answer,,} == "y" ]]; then
        # Filter
        awk '$2 > 0{print $0}' "${RPKM}" > GSE52799/mRNA/SRR1039761.filtered.RPKM
        filtered="GSE52799/mRNA/SRR1039761.RPKM"

        # Run Ribowave
        script/Ribowave \
        -T 9012445  "${filtered}" \
        -a GSE52799/bedgraph/SRR1039770/final.psite \
        -b annotation_fly/final.ORFs \
        -o GSE52799/Ribowave \
        -n SRR1039770.filtered \
        -s script \
        -p 8
elif [[ ${answer,,} == "n" ]]; then
        # Run Ribowave
        script/Ribowave \
        -T 9012445  "${RPKM}" \
        -a GSE2799/bedgraph/SRR1039770/final.psite \
        -b annotation_fly/final.ORFs \
        -o GSE52799/Ribowave \
        -n SRR1039770 \
        -s script \
        -p 8
else
        echo "Exiting now."
fi