##Exercice 1 (Bash)
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed
less -S TAIR9_nRNA.bed
grep + TAIR9_mRNA.bed | grep chr1 | wc ##4366
cut -f11 TAIR9_mRNA.bed | head | sed 's/,/ /g'| sort -n| awk '{print $NF}'| sort -n| sort -r| uniq
grep chr1 TAIR9_mRNA.bed| cut -f11 | sed 's/,/\n/g'|sort -n| tail -10| sort -r 
grep chr1 TAIR9_mRNA.bed | cut -f4,10 | sort -k 2,2nr | head | sort| uniq
