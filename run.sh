## Author: Marc Cernuda Pastor
## Date: 08/10/2018
## Bash Hands-On
## The program was originaly created at the home directory and then moved to bash_HandsOn
## As the script follows the hands on instructions I dind't want to comment to keep the code as clean as possible

## Task 1
mkdir bash_HandsOn	
cd bash_HandsOn
mkdir bin input output logs trash
ls -a
cp -r trash trash2
mv trash trash1
rm -rf trash2

## Task 2
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv
mv sample-groups.tsv input/input.tsv
ln -s /home/marc/bash_HandsOn/input/input.tsv trash1/input_symlink
cp input/input.tsv trash1/input_copy
touch trash1/IAmLearningSomBash
rm -rf trash1

## Task 3
mkdir output/task_3
head -100 input/input.tsv> output/task_3/top100.tsv
tail -50 input/input.tsv > output/task_3/last50.tsv
wc output/task_3/top100.tsv
wc output/task_3/last50.tsv
cat output/task_3/top100.tsv output/task_3/last50.tsv > output/task_3/150together.tsv
cut -f1 output/task_3/150together.tsv> output/task_3/150col1.tsv
paste output/task_3/150col1.tsv output/task_3/150col1.tsv > output/task_3/150firstcX2.tsv

##Task 4
mkdir output/task_4
cut -f2 <(sort -r input/input.tsv) | grep -v Artery | grep -v Adipose > output/task_4/unique.tissues2.txt
cut -f3 <(sort -r input/input.tsv) | grep -v Artery | grep -v Adipose > output/task_4/unique.tissues3.txt
diff output/task_4/unique.tissues2.txt output/task_4/unique.tissues3.txt > output/task_4/differences

##Task 5
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz
gunzip scripts.tar.gz
tar -xf scripts.tar
mv usage.sh bin
PATH=$PATH:~/bash_HandsOn/bin/
chmod +x bin/usage.sh
bash bin/usage.sh testargument ## Just to test the script

##Task 6
wget  https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv
join -t $'\t' -1 1 -2 1  <(sort -k1,1 unknown.samples.tsv) <(sort -k1,1 input/input.tsv) | awk '{print $4,$3,$2,$1}' | sed 's/_/ /g' > joint.tsv

##Task 7

##Exercice 1 - This code is in the exercise1.sh script at bash_HandsOn
#wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed
#less -S TAIR9_nRNA.bed
#grep + TAIR9_mRNA.bed | grep chr1 | wc ##4366
#cut -f11 TAIR9_mRNA.bed | head | sed 's/,/ /g'| sort -n| awk '{print $NF}'| sort -n| sort -r| uniq
#grep chr1 TAIR9_mRNA.bed| cut -f11 | sed 's/,/\n/g'|sort -n| tail -10| sort -r > patterns.txt
#grep chr1 TAIR9_mRNA.bed | cut -f4,10 | sort -k 2,2nr | head | sort| uniq

