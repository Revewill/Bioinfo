---

### $ `grep '^XI' 1.gtf` | `grep -v '^XII'` | `grep -v '^XIV'` | `awk '$3 == "CDS" {print $0}'` | `sort -k5,5n` | `tail -10`

XI	ensembl	CDS	631152	632798	.	+	0	gene_id "YKR097W"; gene_version "1"; transcript_id "YKR097W"; transcript_version "1"; exon_number "1"; gene_name "PCK1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "PCK1"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR097W"; protein_version "1";

XI	ensembl	CDS	633029	635179	.	-	0	gene_id "YKR098C"; gene_version "1"; transcript_id "YKR098C"; transcript_version "1"; exon_number "1"; gene_name "UBP11"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "UBP11"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR098C"; protein_version "1";

XI	ensembl	CDS	635851	638283	.	+	0	gene_id "YKR099W"; gene_version "1"; transcript_id "YKR099W"; transcript_version "1"; exon_number "1"; gene_name "BAS1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "BAS1"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR099W"; protein_version "1";

XI	ensembl	CDS	638904	639968	.	-	0	gene_id "YKR100C"; gene_version "1"; transcript_id "YKR100C"; transcript_version "1"; exon_number "1"; gene_name "SKG1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SKG1"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR100C"; protein_version "1";

XI	ensembl	CDS	640540	642501	.	+	0	gene_id "YKR101W"; gene_version "1"; transcript_id "YKR101W"; transcript_version "1"; exon_number "1"; gene_name "SIR1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "SIR1"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR101W"; protein_version "1";

XI	ensembl	CDS	646356	649862	.	+	0	gene_id "YKR102W"; gene_version "1"; transcript_id "YKR102W"; transcript_version "1"; exon_number "1"; gene_name "FLO10"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "FLO10"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR102W"; protein_version "1";

XI	ensembl	CDS	653080	656733	.	+	0	gene_id "YKR103W"; gene_version "1"; transcript_id "YKR103W"; transcript_version "1"; exon_number "1"; gene_name "NFT1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "NFT1"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR103W"; protein_version "1";

XI	ensembl	CDS	656836	657753	.	+	0	gene_id "YKR104W"; gene_version "1"; transcript_id "YKR104W"; transcript_version "1"; exon_number "1"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "YKR104W"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR104W"; protein_version "1";

XI	ensembl	CDS	658719	660464	.	-	0	gene_id "YKR105C"; gene_version "1"; transcript_id "YKR105C"; transcript_version "1"; exon_number "1"; gene_name "VBA5"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "VBA5"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR105C"; protein_version "1";

XI	ensembl	CDS	661442	663286	.	+	0	gene_id "YKR106W"; gene_version "1"; transcript_id "YKR106W"; transcript_version "1"; exon_number "1"; gene_name "GEX2"; gene_source "ensembl"; gene_biotype "protein_coding"; transcript_name "GEX2"; transcript_source "ensembl"; transcript_biotype "protein_coding"; protein_id "YKR106W"; protein_version "1";

---

### $ `grep '^IV' 1.gtf` | `awk '{print $3}'` | `sort` | `uniq -c` | `sort -k1,1n`

853 start_codon

853 stop_codon

886 gene

886 transcript

895 CDS

933 exon

---

### $ `grep -v '^IV' 1.gtf` | `awk '$7 == "-" && $3 == "CDS" {print $5-$4 + 1}'` | `sort -n` | `tail -2`

12276

14730

---

### `$ awk '$1 == "XV" {print $5-$4 + 1, $0}' 1.gtf` | `sort -k1,1n` | `tail -5` | `awk '{print $10, $11, $1}'`

gene_id "YOR396W"; 5391

gene_id "YOL081W"; 9237

gene_id "YOL081W"; 9240

gene_id "YOL081W"; 9240

gene_id "YOL081W"; 9240

---

### $ `awk 'BEGIN{FS="\t"}{print NF}' 1.gtf` | `sort` | `uniq -c`

5 1

42247 9
