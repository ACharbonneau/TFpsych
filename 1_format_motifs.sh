
pwms_all_motifs/

module load MEME/5.0.4

for i in *.txt; do tail -n +2  ${i} | cut -f 2,3,4,5 | matrix2meme -dna > ${i}.fixed; done

find ./ -size  0 -print0 |xargs -0 rm --

for i in *.fixed; do newname=$(basename ${i} _2.00.txt.fixed); sed -i "s/MOTIF 1/MOTIF ${newname}/" ${i}; done

justone=`ls *.fixed | head -n 1`

head -9 ${justone} > allmotifs

for i in *.fixed; do tail -n +9 ${i} >> allmotifs; done
