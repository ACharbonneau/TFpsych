#qsub -I -N MyJobName -l nodes=1:ppn=1,mem=64gb,walltime=48:00:00,feature='intel18'

module load MEME/5.0.4

module load BEDTools/2.27.1

mkdir bedfiles

cd bedfiles

##############################################

## Psychiatric Traits

### Anxiety
zcat ../RawData/anxiety.meta.full.fs.tbl.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $9}' > anxiety.meta.full.fs.tbl.bed

### Autism
zcat ../RawData/iPSYCH-PGC_ASD_Nov2017.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$1 "\t" $3 - 100 "\t" $3 + 100 "\t" $2 "\t" $9}' > iPSYCH-PGC_ASD_Nov2017.bed

### Bipolar
zcat ../RawData/daner_PGC_BIP32b_mds7a_0416a.gz | tail -n +2 | awk 'FNR > 1{if ((0+$11)<0.0000001) print "chr"$1 "\t" $3 - 100 "\t" $3 + 100 "\t" $2 "\t" $11}' > daner_PGC_BIP32b_mds7a_0416a.bed

### MDD (major depressive disorder)
zcat ../RawData/MDD2018_ex23andMe.gz | tail -n +2 | awk 'FNR > 1{if ((0+$11)<0.0000001) print "chr"$1 "\t" $3 - 100 "\t" $3 + 100 "\t" $2 "\t" $11}' > MDD2018_ex23andMe.bed

### Schizophrenia
zcat ../RawData/pgc.scz2.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print $1 "\t" $5 - 100 "\t" $5 + 100 "\t" $2 "\t" $9}' > pgc.scz2_regions.bed

##############################################

## Substance Use traits

### Alcohol Use Disorder
zcat ../RawData/pgc.aud.gz | tail -n +2 | awk 'FNR > 1{if ((0+$7)<0.0000001) print "chr"$1 "\t" $3 - 100 "\t" $3 + 100 "\t" $2 "\t" $7}' > pgc.aud.bed

 

##############################################
## Behavioral traits

### Educational Attainment
zcat ../RawData/GWAS_EA_excl23andMe.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $9}' > GWAS_EA_excl23andMe.txt.bed

### Extraversion
zcat ../RawData/GPC-2.EXTRAVERSION.full.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$8)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $8}' > GPC-2.EXTRAVERSION.full.txt.bed

### IQ
zcat ../RawData/SavageJansen_2018_intelligence_metaanalysis.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$11)<0.0000001) print "chr"$3 "\t" $4 - 100 "\t" $4 + 100 "\t" $1 "\t" $11}' > SavageJansen_2018_intelligence_metaanalysis.txt.bed

### Neuroticism 
# File doesn't have header row, assuming its the same as ss/GPC-2.EXTRAVERSION.full.txt.gz
#zcat ss/GPC-2.EXTRAVERSION.full.txt.gz | head -n 1 > ss/newGPC
#cat ss/newGPC ss/GPC-2.NEUROTICISM.full.txt > ss/GPC-2.NEUROTICISM.edit
#gzip -f ss/GPC-2.NEUROTICISM.edit

zcat ../RawData/GPC-2.NEUROTICISM.edit.gz | tail -n +2 | awk 'FNR > 1{if ((0+$8)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $8}' > GPC-2.NEUROTICISM.edit.gz.bed

### Risky Behavior
zcat ../RawData/RISK_GWAS_MA_UKB+replication.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $9}' > RISK_GWAS_MA_UKB+replication.txt.bed

### Well-being
zcat ../RawData/SWB_Full.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $9}' > SWB_Full.txt.bed

##############################################
## Neurological Traits

### Alzheimers 1
zcat ../RawData/AD_sumstats_Jansenetal.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$8)<0.0000001) print "chr"$2 "\t" $3 - 100 "\t" $3 + 100 "\t" $6 "\t" $8}' > AD_sumstats_Jansenetal.txt.bed

### Alzheimers 2
zcat ../RawData/Kunkle_etal_Stage1_results.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$8)<0.0000001) print "chr"$1 "\t" $2 - 100 "\t" $2 + 100 "\t" $3 "\t" $8}' > Kunkle_etal_Stage1_results.txt.bed

### Epilepsy
zcat ../RawData/ILAE_All_Epi_11.8.14.gz | tail -n +2 | awk 'FNR > 1{if ((0+$6)<0.0000001) print "chr"$12 "\t" $13 - 100 "\t" $13 + 100 "\t" $1 "\t" $6}' > ILAE_All_Epi_11.8.14.bed

### Parkinsons Disease
zcat ../RawData/Pankratz_Parkinsons_22687-SuppTable1.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$6)<0.0000001) print $1}' > Pankratz_Parkinsons_22687-SuppTable1.txt.snps
grep -wf Pankratz_Parkinsons_22687-SuppTable1.txt.snps ../RawData/allsnps.bed | sort -k 4 > Pankratz_Parkinsons_22687-SuppTable1.txt.locations
zcat ../RawData/Pankratz_Parkinsons_22687-SuppTable1.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$6)<0.0000001) print $1 "\t" $6}' | sort > Pankratz_Parkinsons_22687-SuppTable1.txt.pvals
join -1 4 -2 1 Pankratz_Parkinsons_22687-SuppTable1.txt.locations Pankratz_Parkinsons_22687-SuppTable1.txt.pvals > Pankratz_Parkinsons_22687-SuppTable1.txt.temp
awk '{print $2 "\t" $3 - 100 "\t" $3 + 100 "\t" $1 "\t" $7}' Pankratz_Parkinsons_22687-SuppTable1.txt.temp > Pankratz_Parkinsons_22687-SuppTable1.txt.bed

##############################################
## Negative Control

### Age-related macular degeneration
zcat ../RawData/Fristche_AMDGene2013_Neovascular_v_Controls.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$6)<0.0000001) print $1}' > Fristche_AMDGene2013_Neovascular_v_Controls.txt.snps
grep -wf Fristche_AMDGene2013_Neovascular_v_Controls.txt.snps ../RawData/allsnps.bed | sort -k 4 > Fristche_AMDGene2013_Neovascular_v_Controls.txt.locations
zcat ../RawData/Fristche_AMDGene2013_Neovascular_v_Controls.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$6)<0.0000001) print $1 "\t" $6}' | sort > Fristche_AMDGene2013_Neovascular_v_Controls.txt.pvals
join -1 4 -2 1 Fristche_AMDGene2013_Neovascular_v_Controls.txt.locations Fristche_AMDGene2013_Neovascular_v_Controls.txt.pvals > Fristche_AMDGene2013_Neovascular_v_Controls.txt.temp
awk '{print $2 "\t" $3 -100 "\t" $3 + 100 "\t" $1 "\t" $7}' Fristche_AMDGene2013_Neovascular_v_Controls.txt.temp > Fristche_AMDGene2013_Neovascular_v_Controls.txt.bed

### BMI
zcat ../RawData/Meta-analysis_Locke_et_al+UKBiobank_2018_UPDATED.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$1 "\t" $2 - 100 "\t" $2 + 100 "\t" $3 "\t" $9}' > Meta-analysis_Locke_et_al+UKBiobank_2018_UPDATED.txt.bed

### Height
zcat ../RawData/Meta-analysis_Wood_et_al+UKBiobank_2018.txt.gz | tail -n +2 | awk 'FNR > 1{if ((0+$9)<0.0000001) print "chr"$1 "\t" $2 - 100 "\t" $2 + 100 "\t" $1 "\t" $9}' > Meta-analysis_Wood_et_al+UKBiobank_2018.txt.bed

### Make FASTA files from bedfiles

mkdir ../fastas

for i in *.bed ; do bedtools getfasta -fi ../RawData/hg19.fa -bed ${i} > ../fastas/${i}.fasta; done

### scan FASTA files for motifs

for i in ../fastas/*
   do temp=`basename fastas/${i} .fasta`
   fimo --o ../${temp} ../RawData/pwms_all_motifs/allmotifs ${i}
done

# Compare conserved regions from 30 way primate to SNP windows

for i in *.bed
   do temp=`basename fastas/${i} .fasta`
   bedtools intersect -wa -wb -a ../RawData/phastConsElements30way.bed -b ${i} > ../${i}/${i}.cons
   cp ${i} ../${i}/${i}
done
   

