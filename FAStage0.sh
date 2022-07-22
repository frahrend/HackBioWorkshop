#BioHack - Stage 0 - Submission by Franziska Ahrend

#to run this through the terminal: bash FAStage0.sh

firstname="Franziska"
lastname="Ahrend"
echo $firstname $lastname 
#Output: Franziska Ahrend

firstname="Franziska"
lastname="Ahrend"
echo $firstname 
echo $lastname
#Franziska
#Ahrend



#Notebook 1
echo Notebook1
mkdir Franziska
mkdir biocomputing && cd biocomputing
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk 
mv wildtype.fna ../Franziska/
rm -r wildtype.gbk.1
cd ../Franziska && grep -c  "tatatata" wildtype.fna 
grep "tatatata" wildtype.fna > mutant
clear; history
ls && ls ../biocomputing 
#exit
cd ..

#Notebook 2
echo Notebook2
#0.2.1
figlet Franziska 
#0.2.3
mkdir compare
#0.2.3a
cd compare && wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz 
#0.2.3b
gunzip unix_intro_data.tar.gz
#0.2.3c
tar -xvf unix_intro_data.tar
#0.2.3d
cd seqmonk_genomes/Saccharomyces\ cerevisiae/EF4 && grep rRNA Mito.dat 
#0.2.3e
cp Mito.dat ../../../
cd ..; cd ..; cd ..
#0.2.3fi
nano Mito.dat
#now change  Mito to Mitochondrion in the ID and AC header lines
#save the file and exit nano: ctrl+x	y	Return
#0.2.3fiii
mv Mito.dat Mitochondrion.txt
#0.2.4
cd FastQ_Data
#0.2.4a
wc -l < lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
#0.2.4b
wc -l *.fastq.gz | tail -1 && wc -l *.fastq.gz | tail -1 > lineCounter.txt 

#0.2.5
#I needed first to download anaconda with: brew install anaconda
#0.2.5a
conda install -c bioconda seqtk
#0.2.5b
conda install -c bioconda samtools
#0.2.5c
conda install -c bioconda fastp







