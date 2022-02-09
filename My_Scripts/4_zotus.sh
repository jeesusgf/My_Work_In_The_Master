
cd ../Caso1

mkdir Zotus

### 1 - Remove the noise of our samples

~/usearch -unoise3 Merged/uniques.fasta -zotus Zotus/zotus100.fa

### 2 - Sort the samples

~/usearch -sortbylength Zotus/zotus100.fa -fastaout Zotus/zotus100_sort.fa -minseqlength 210

### 3 - Clustering the zotus

~/usearch -cluster_smallmem Zotus/zotus100_sort.fa -id 0.99 -centroids Zotus/zotus.fa

### 4 - Create Zotus table

mkdir Resultados

~/usearch -otutab Merged/truncated.fastq -otus Zotus/zotus.fa \
-id 0.97 -otutabout Resultados/Tabla_Zotus.tsv

### 5 - Blast with specific database

~/usearch -usearch_local Zotus/zotus.fa -db ~/Documents/BBD_ambiental/Especifica_16S_ambiental_v9.fasta \
-id 0.95 -blast6out Resultados/taxonomy_recognition.outfm6 -notmatched Zotus/not_matched.fa -strand both -top_hit_only -query_cov 0.90

### 6 - Export data to a tsv

awk '{ print $1"\t"$2 }' taxonomy_recognition.outfm6 > Tabla_especies.tsv

### 7 - Blast no-matched with syntax database

~/usearch -sintax Zotus/not_matched.fa -db ~/Documents/BBD_ambiental/Sintax_RDP_16S_Version18_062020.fa \
-strand both -tabbedout Resultados/taxonomia_predicted.tsv -sintax_cutoff 0.97
