#BioHack - Stage 1 - Submission by Franziska Ahrend

#to run this through the terminal: bash FAStage1.sh

#install packages: 

#conda installation
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh 
conda init

#installation of bioinformatics tools
conda install -c bioconda fastqc
conda install -c bioconda seqtk
conda install -c bioconda samtools
conda install -c bioconda fastp
conda install -c bioconda star
conda install -c bioconda qualimap
conda install -c bioconda htseq

#Downloads some (>2) sample datasets (.fastq.gz) 
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Drysdale_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/Drysdale_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/SRR1552451.fastq.gz

#Create a folder called output
mkdir output

#Implement the 3 software on the downloaded files (sample datasets) and send all outputs to the output folder.

#1. fastqc
fastqc Drysdale_R1.fastq.gz --outdir=output
fastqc Drysdale_R2.fastq.gz --outdir=output
fastqc SRR1552451.fastq.gz --outdir=output

cd output
ls


unzip Drysdale_R1_fastqc.zip 
cd Drysdale_R1_fastqc/
nano summary.txt 
#close with control+X
cd ..

unzip Drysdale_R2_fastqc.zip 
cd Drysdale_R2_fastqc/
nano summary.txt 
#close with control+X
cd ..

unzip SRR1552451_fastqc.zip
cd SRR1552451_fastqc/ && ls
nano summary.txt 
#close with control+X

cd ..

#2. samtools with .bam files from https://github.com/josoga2/yt-dataset/raw/main/dataset/alignment_map/

#Documentation of samtools: http://www.htslib.org/doc/samtools.html

wget https://github.com/josoga2/yt-dataset/raw/main/dataset/alignment_map/Alsen.bam
samtools flagstat Alsen.bam > output/alsen_flagstat.txt
cat output/alsen_flagstat.txt 


wget https://github.com/josoga2/yt-dataset/raw/main/dataset/alignment_map/Baxter.bam
samtools flagstat Baxter.bam > output/baxter_flagstat.txt
cat output/baxter_flagstat.txt 

wget https://github.com/josoga2/yt-dataset/raw/main/dataset/alignment_map/Chara.bam
samtools flagstat Chara.bam > output/chara_flagstat.txt
cat output/chara_flagstat.txt 

#3. Qualimap 

#Alsen file, sort with samtools
samtools sort Alsen.bam -o output/alsen_sort.bam 
mkdir output/Alsen_Qualimap && qualimap bamqc -bam 
output/alsen_sort.bam --outdir=output/Alsen_Qualimap && cat output/Alsen_Qualimap/raw_data_qualimapReport/coverage_histogram.txt 

#Baxter file, sort with samtools
samtools sort Baxter.bam -o output/baxter_sort.bam 
mkdir output/Baxter_Qualimap && qualimap bamqc -bam output/baxter_sort.bam --outdir=output/Baxter_Qualimap && cat output/Baxter_Qualimap/raw_data_qualimapReport/coverage_histogram.txt 


#Chara file, sort with samtools
samtools sort Chara.bam -o output/chara_sort.bam 
mkdir output/Chara_Qualimap && qualimap bamqc -bam output/chara_sort.bam --outdir=output/Chara_Qualimap && cat output/Chara_Qualimap/raw_data_qualimapReport/coverage_histogram.txt 


ls
cd output/ && ls

cd .. 









