####	Data Import from GitHub	 ####
####	Script Name: DataImportfromGithub.R

#-------------------------------------------------------------------------#
####	Description:	 ####
# This script will import all .csv files associated with the project.  If all goes according to plan, running this script FIRST, followed by any sucessive script in the GitHub directory should compile without error.


#-------------------------------------------------------------------------#
####	Begin Script	 ####
#-------------------------------------------------------------------------#


# url.data="_____" # <-- Replace ____ with raw.github.com -- .csv.gz datafile
# url.source="____"  # <-- Replace ____ with raw.github.com -- .R Script File

url.data.flow.csv="https://github.com/leepanter/MSproject_RBC/blob/master/Data/Pre-FilterData/flow.csv.gz?raw=true"
dat.flow.csv.gz="LocalDatFile_flow.csv.gz"
download.file(url.data.flow.csv, dat.flow.csv.gz)
flow=read.csv(gzfile("LocalDatFile_flow.csv.gz"))


# dat.csv.gz="LocalDatFile.csv.gz"
# models.R="LocalSourceFile.R"

# download.file(url.data, LocalDatFile.csv.gz)
# dat=read.csv(gzfile("LocalDatFile.csv.gz"))

# source_url(url.source, sha_url(url.source))





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
