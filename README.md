# ONWebDUALSimport
Import scripts for ONTology-based Web Database for Understanding Lateral Sclerosis

## Whom this library address

The library provides the access to the unified database that is provided by the members of the ONWebDUALS consortium. 

If you are not authorized member of the ONWebDUALS consortium and doesn't have access to the actual raw data files, 
this library will offer no service to you.

## How to use it

Provided you are the member of the ALS consortium, you should gather the following pieces together, before using the library:

1. Computer where you have rights to install software.
2. Working installation of the R language and preferrably also the RStudio. Simply go to https://cran.r-project.org/ and follow installation instructions. If you choose to get the RStudio (the visual IDE for the R), visit https://www.rstudio.com/products/rstudio/download/#download and install the Open Source version of the RStudio Desktop.
3. Java (any OpenJDK or Oracle's, version 8 or 9 will work). On Ubuntu install with e.g. `sudo apt install openjdk-8-jre`.
4. If your machine is Linux, development versions of system libraries *Secure Sockets Layer toolkit* , *libcurl* and *GNOME XML library*. On ubuntu they can be installed with `sudo apt install libxml2-dev libssl-dev libcurl4-openssl-dev`.
5. If you want to get access to the web database, you should make sure you have a connection to the VPN offered by the Nalecz Institute of Biocybernetics and Biomedical Engineering (IBIB).
6. If you want to use this library to unify the multitude databases that were gathered by the project during the initial stages, you should first get the individual Excel files and put them in the right directory structure, described further on. We will assume that the files are stored in `/home/user/ALS/inputdb`.

## Excel file directory layout

At the moment, library supports the following input files, together with the required directory structure:

```
/home/user/ALS/inputdb
├── ALS
│   ├── ANTA
│   │   └── ANTA patients all 111.xlsx
│   ├── HANN
│   │   ├── Patienten Tabelle 1-01-2017.xlsx
│   │   └── Patienten Tabelle 2.xlsx
│   ├── JENA
│   │   ├── Excel questionnaire_20160902 Jena.xlsx
│   │   └── Excel questionnaire Jena Patient_20170531.xlsx
│   ├── LISB
│   │   └── als (2)_Lisbon reviewed_marta_3april.xlsm
│   └── WAWA
│       └── OnWeb WARS patients.xlsx
└── control
    ├── ANTA
    │   └── Excel questionnaire_ANTControl_2017(Warsaw).xlsx
    ├── HANN
    │   ├── Kontrollpersonen Tabelle 1.xlsx
    │   └── Kontrollpersonen Tabelle 2.xlsx
    ├── JENA
    │   └── Excel questionnaire Jena Control_20170531.xlsx
    ├── LISB
    │   └── LISB (2-Control)_Marta.xlsm
    └── WAWA
        └── OnWeb WAWA control 10.01.2017_FIX.xlsx
```

## Installing the library

We will start in the point, where you have installed the R language perhaps with RStudio. 

### Step 1 

Run the R or RStudio.

### Step 2 

If you don't have the `devtools` library (and by default you don't), in the prompt type 

```
install.packages("devtools")
```

Accept all the defaults, and choose a CRAN mirror that seems to be physically close to you.

After a while the library will get installed. In case of any errors, read the output. On Ubuntu you might need to install
packages `libssl-dev` and `libcurl4-openssl-dev`, as stated before.

### Step 3

Now with the help of the `devtools` we can install the `ONWebDUALSimport` library itself:

```
devtools::install_github('adamryczkowski/ONWebDUALSimport')
```

This step will take a little bit longer, because this library has many dependencies. If you don't have Java or XML library, this step will throw you an error.

### Step 4

Load the library with
```
library('ONWebDUALSimport')
```

## Running the library

To get the Excel version of the web database, enter the following command:

```
webdb<-importWebDatabase(flag_ALSFRS_as_integers=TRUE)
```

Parameter `flag_ALSFRS_as_integers` determines whether we prefer results from the ALSFRS to be encoded as labelled factor variables, or simple integers - more suitable for numeric computations.

To get the Excel version of the Excel database, enter the following command. Make sure that under the `/home/user/ALS/inputdb` you have the correct directory structure. Otherwise the script will not find the files and will report an error.

```
xlsdb<-importXLSDatabases(path_prefix='/home/user/ALS/inputdb', flag_ALSFRS_as_integers=TRUE)
```

If one wish to get both Excel and web questionnaires together in one database, use the following function:

```
alldb<-importAllDatabases(path_prefix='/home/user/ALS/inputdb', flag_ALSFRS_as_integers=TRUE)

```

At the moment of writing (20th of February 2018) the `importAllDatabases()` doesn't merge all the questions yet, and may contain some debugging code. 
