

### 1 - First QC of the samples

cd ../[Data_Folder]
mkdir QC

for file in Muestras/*.fastq
do
fastqc $file -o QC/
done

mkdir QC/Report
multiqc QC/ -o QC/Report/
rm QC/Report/multiqc_data/
