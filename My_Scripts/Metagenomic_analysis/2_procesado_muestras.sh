
### 1 - Curing of samples 

cd ../[Data_Folder]
mkdir Muestras_filtradas

for file in Muestras/*.fastq
do
~/fastp -i ${file::-7}1.fastq -t 5 -o Muestras_filtradas/${file:9:-7}R1.fastq -I ${file::-7}2.fastq -T 10 -O Muestras_filtradas/${file:9:-7}R2.fastq
done

rm fastp*

### 2 - QC of cured samples

mkdir QC_filtradas
mkdir QC_filtradas/Report

for file in Muestras_filtradas/*.fastq
do
fastqc $file -o QC_filtradas/
done

multiqc QC_filtradas/ -o QC_filtradas/Report/
rm QC_filtradas/Report/multiqc_data/
