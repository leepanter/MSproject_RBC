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


####	Pre-Filter Data	 ####

### Flow
urlDataflow="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/flow.csv.gz"
flow="flow.csv.gz"
download.file(urlDataflow, flow)
flow=read.csv(gzfile("flow.csv.gz"))

#### indseq
urlData____="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/____.csv.gz"
____="____.csv.gz"
download.file(urlData____, ____)
flow=read.csv(gzfile("____.csv.gz"))

#### mdata
urlData____="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/____.csv.gz"
____="____.csv.gz"
download.file(urlData____, ____)
flow=read.csv(gzfile("____.csv.gz"))

#### seq
urlData____="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/____.csv.gz"
____="____.csv.gz"
download.file(urlData____, ____)
flow=read.csv(gzfile("____.csv.gz"))





####	Post-Filter Data	 ####

### flowFilter
urlDataflow="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/flow.csv.gz"
flow="flow.csv.gz"
download.file(urlDataflow, flow)
flow=read.csv(gzfile("flow.csv.gz"))

#### indseqFilter
urlData____="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/____.csv.gz"
____="____.csv.gz"
download.file(urlData____, ____)
flow=read.csv(gzfile("____.csv.gz"))

#### mdataFilter
urlData____="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/____.csv.gz"
____="____.csv.gz"
download.file(urlData____, ____)
flow=read.csv(gzfile("____.csv.gz"))

#### seqFilter
urlData____="https://github.com/leepanter/MSproject_RBC/raw/master/Data/PreFilterData/____.csv.gz"
____="____.csv.gz"
download.file(urlData____, ____)
flow=read.csv(gzfile("____.csv.gz"))




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
