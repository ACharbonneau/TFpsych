module load MEME/5.0.4

module load BEDTools/2.27.1

mkdir scz

cd scz

zcat ../RawData/pgc.scz2.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print $1 "\t" $5 - 100 "\t" $5 + 100 "\t" $2 "\t" $9}' > pgc.scz2_regions.bed

bedtools getfasta -fi ../RawData/hg19.fa -bed pgc.scz2_regions.bed > pgc.scz2_regions.fasta

fimo ../RawData pgc.scz2_regions.fasta
