

### 1 - First QC of the samples

cd ../Caso1

mkdir QC

for file in Muestras/*.fastq
do
fastqc $file -o QC/
done

rm QC/*.zip
