library(RCurl)

#################
# download data #
#################
# These are the easy cities with data from Socrata 

URL <- "https://data.cityofchicago.org/api/views/4ijn-s7e5/rows.csv?accessType=DOWNLOAD&bom=true"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_CHI <- read.csv(textConnection(X))

URL <- "https://nycopendata.socrata.com/api/views/xx67-kt59/rows.csv?accessType=DOWNLOAD"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_NY <- read.csv(textConnection(X))

URL <- "https://data.kingcounty.gov/api/views/f29f-zza5/rows.csv?accessType=DOWNLOAD"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_KING <- read.csv(textConnection(X))

URL <- "https://data.montgomerycountymd.gov/api/views/5pue-gfbe/rows.csv?accessType=DOWNLOAD"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_MONT <- read.csv(textConnection(X))

URL <- "https://data.cityofboston.gov/api/views/qndu-wx8w/rows.csv?accessType=DOWNLOAD"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_BST <- read.csv(textConnection(X))

URL <- "https://data.acgov.org/api/views/3d5b-2rnz/rows.csv?accessType=DOWNLOAD"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_ALA <- read.csv(textConnection(X))

URL <- "https://data.austintexas.gov/api/views/ecmv-9xxi/rows.csv?accessType=DOWNLOAD"
X <- getURL(URL, ssl.verifypeer = FALSE)
data_AUST <- read.csv(textConnection(X))

#################
# San Francisco #
#################
URL <- "https://extxfer.sfdph.org/food/SFFoodProgram_Complete_Data.zip" # get the file url
SFdir <- tempdir() # create a temporary directory
tf <- tempfile(tmpdir=SFdir, fileext=".zip") # create the placeholder file
download.file(URL, tf) # download into the placeholder file

fname1 <- unzip(tf, list=TRUE)$Name[1] # get the name of the first file in the zip archive
unzip(tf, files=fname1, exdir=SFdir, overwrite=TRUE) # unzip the file to the temporary directory
fpath1 <- file.path(SFdir, fname1) # fpath is the full path to the extracted file

fname2 <- unzip(tf, list=TRUE)$Name[2] 
unzip(tf, files=fname2, exdir=SFdir, overwrite=TRUE) 
fpath2 <- file.path(SFdir, fname2) 

fname3 <- unzip(tf, list=TRUE)$Name[3] 
unzip(tf, files=fname3, exdir=SFdir, overwrite=TRUE) 
fpath3 <- file.path(SFdir, fname3)

# stringsAsFactors=TRUE will screw up conversion to numeric!
data_SF_viol <-  read.csv(fpath1, header=TRUE, row.names=NULL, stringsAsFactors=FALSE)
data_SF_busn <-  read.csv(fpath2, header=TRUE, row.names=NULL, stringsAsFactors=FALSE)
data_SF_insp <-  read.csv(fpath3, header=TRUE, row.names=NULL, stringsAsFactors=FALSE)
