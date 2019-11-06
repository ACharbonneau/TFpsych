
bedtools getfasta -fi ../RawData/hg19.fa -bed pgc.scz2_regions.bed > pgc.scz2_regions.fasta

bedtools getfasta -name -tab -fi ../RawData/hg19.fa -bed pgc.scz2_regions.bed > pgc.scz2_regions.tsv


fimo ../pwms_all_motifs/allmotifs pgc.scz2_regions.fasta
