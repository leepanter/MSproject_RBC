####	Data Import from GitHub	 ####
####	Script Name: DataImportfromGithub.R

#-------------------------------------------------------------------------#
####	Description:	 ####
# This script will import all .csv files associated with the project.  If all goes according to plan, running this script FIRST, followed by any sucessive script in the GitHub directory should compile without error.

# Package Dependencies:
library(downloader)
library(RCurl)

#-------------------------------------------------------------------------#
####	Begin Script	 ####
#-------------------------------------------------------------------------#


# url.data="_____" # <-- Replace ____ with raw.github.com -- .csv.gz datafile
# url.source="____"  # <-- Replace ____ with raw.github.com -- .R Script File

# dat.csv.gz="LocalDatFile.csv.gz"
# models.R="LocalSourceFile.R"

# download.file(url.data, LocalDatFile.csv.gz)
# dat=read.csv(gzfile("LocalDatFile.csv.gz"))

# source_url(url.source, sha_url(url.source))




####	Original Data Set	 ####

urlDataoriginal="https://github.com/leepanter/MSproject_RBC/raw/master/Data/InitialData/Initial_Data.Rdata.gz"
RBC_Project_Data="RBC_Project_Data.RData.gz"
download.file(urlDataoriginal,RBC_Project_Data)
RBC_Project_Data=load(gzfile("RBC_Project_Data.RData.gz"))

####	Pre-Filter Data	 ####

### Flow
urlDataflow="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/flow.csv.gz"
flow="flow.csv.gz"
download.file(urlDataflow, flow)
flow=read.csv(gzfile("flow.csv.gz"))

#### indseq
urlDataindseq="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/indseq.csv.gz"
indseq="indseq.csv.gz"
download.file(urlDataindseq, indseq)
indseq=read.csv(gzfile("indseq.csv.gz"))

#### mdata
urlDatamdata="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/mdata.csv.gz"
mdata="mdata.csv.gz"
download.file(urlDatamdata, mdata)
mdata=read.csv(gzfile("mdata.csv.gz"))

#### seq
urlDataseq="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/seq.csv.gz"
seq="seq.csv.gz"
download.file(urlDataseq, seq)
seq=read.csv(gzfile("seq.csv.gz"))





####	Post-Filter Data	 ####

### flowFilter
urlDataflowFilter="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PostFilterData/flowFilter.csv.gz"
flowFilter="flowFilter.csv.gz"
download.file(urlDataflowFilter, flowFilter)
flowFilter=read.csv(gzfile("flowFilter.csv.gz"))

#### indseqFilter
urlDataindseqFilter="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PostFilterData/indseqFilter.csv.gz"
indseqFilter="indseqFilter.csv.gz"
download.file(urlDataindseqFilter, indseqFilter)
indseqFilter=read.csv(gzfile("indseqFilter.csv.gz"))

#### mdataFilter
urlDatamdataFilter="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PostFilterData/mdataFilter.csv.gz"
mdataFilter="mdataFilter.csv.gz"
download.file(urlDatamdataFilter, mdataFilter)
mdataFilter=read.csv(gzfile("mdataFilter.csv.gz"))

#### seqFilter
urlDataseqFilter="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PostFilterData/seqFilter.csv.gz"
seqFilter="seqFilter.csv.gz"
download.file(urlDataseqFilter, seqFilter)
seqFilter=read.csv(gzfile("seqFilter.csv.gz"))






#-------------------------------------------------------------------------#
####	End Script	 ####
#-------------------------------------------------------------------------#





#-------------------------------------------------------------------------#
#####	Post-Script	#####

####  Notes:

####  Compilation Errors:

####  Execution Errors:

####  Next Scripts to Consider:

#-------------------------------------------------------------------------#
