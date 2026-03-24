#!/bin/bash

XML_FILE="$1"

if [ -z "$XML_FILE" ]; then
    echo "Usage: $0 <annotation_report.xml>"
    exit 1
fi

if ! command -v xmlstarlet &> /dev/null; then
    echo "Error: xmlstarlet is not installed."
    exit 1
fi

echo "Type,Count,Total_Length_bp"

# Protein-coding genes - use independent variable name
prot_count=$(xmlstarlet sel -t -v "//AssemblyCounts[@Accession='GCF_000001305.16']/Counts[@feature_type='genes']/Subcount[@subtype='protein coding']" "$XML_FILE")
# Get protein-coding gene mean length if available
prot_mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='protein_coding']/Mean" "$XML_FILE")
if [ -n "$prot_mean" ]; then
    prot_total=$(echo "$prot_count * $prot_mean" | bc | xargs printf "%.0f")
else
    # If no specific protein_coding category found, fall back to global gene mean (may have inaccuracies)
    gene_mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='Genes']/Mean" "$XML_FILE")
    prot_total=$(echo "$prot_count * $gene_mean" | bc | xargs printf "%.0f")
fi
echo "Protein-coding genes,$prot_count,$prot_total"

# Non-coding RNA genes
non_count=$(xmlstarlet sel -t -v "//AssemblyCounts[@Accession='GCF_000001305.16']/Counts[@feature_type='genes']/Subcount[@subtype='non coding']" "$XML_FILE")
# Get non-coding RNA mean length if available
non_mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='non_coding_rna']/Mean" "$XML_FILE")
if [ -n "$non_mean" ]; then
    non_total=$(echo "$non_count * $non_mean" | bc | xargs printf "%.0f")
else
    # Fall back to global gene mean
    gene_mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='Genes']/Mean" "$XML_FILE")
    non_total=$(echo "$non_count * $gene_mean" | bc | xargs printf "%.0f")
fi
echo "Non-coding RNA genes,$non_count,$non_total"

# Pseudogenes
non_transcribed=$(xmlstarlet sel -t -v "//AssemblyCounts[@Accession='GCF_000001305.16']/Counts[@feature_type='genes']/Subcount[@subtype='non-transcribed pseudo']" "$XML_FILE")
transcribed=$(xmlstarlet sel -t -v "//AssemblyCounts[@Accession='GCF_000001305.16']/Counts[@feature_type='genes']/Subcount[@subtype='transcribed pseudo']" "$XML_FILE")
pseudo_total=$((non_transcribed + transcribed))

# Use pseudogene mean length if available
pseudo_mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='pseudogene']/Mean" "$XML_FILE")
if [ -n "$pseudo_mean" ]; then
    pseudo_total_span=$(echo "$pseudo_total * $pseudo_mean" | bc | xargs printf "%.0f")
else
    gene_mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='Genes']/Mean" "$XML_FILE")
    pseudo_total_span=$(echo "$pseudo_total * $gene_mean" | bc | xargs printf "%.0f")
fi
echo "Pseudogenes,$pseudo_total,$pseudo_total_span"

# --- RNA transcripts (use length statistics from each category) ---
for rna_type in lncRNA miRNA misc_RNA rRNA snRNA snoRNA tRNA mRNA; do
    count=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='$rna_type']/Count" "$XML_FILE")
    mean=$(xmlstarlet sel -t -v "//AssemblyStats[@Accession='GCF_000001305.16']/LengthStats[@category='$rna_type']/Mean" "$XML_FILE")
    if [ -n "$count" ] && [ -n "$mean" ]; then
        total=$(echo "$count * $mean" | bc | xargs printf "%.0f")
        echo "$rna_type transcripts,$count,$total"
    fi
done 
