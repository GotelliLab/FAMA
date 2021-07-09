# FAMA

README.md updated: 08 July 2021

Nicholas J. Gotelli

This repository contains data files and R scripts for reproducing the numerical and graphical output from:

> Gotelli N.J., D.B. Booher, M.C. Urban, W. Ulrich, A.V. Suarez, D.K. Skelly, D.J. Russell, R.J. Rowe, M. Rothendler, N. Rios, S.M. Rehan, G. Ni, C.S. Moreau, A.E. Magurran, F.A.M. Jones, G.R. Graves, C. Fiera, U. Burkhardt, R.B. Primack. in press. Estimating Species Relative Abundances From Museum Records. Methods in Ecology and Evolution.

The repository is called FAMA (Field Abundance - Museum Abundance) and is organized as an R project with directories containing *Scripts* and *RawData*, and directories that will hold the *Output* and *DataObjects*.

When you clone this repository, the *Output* and *DataObjects* directories are empty (except for a hidden `.keep` file so that github respects the empty directory). To populate these directories with all of the output, simply run the `BatchProcessFiles.R` script in the `Scripts` directory.

## Directory Contents

### *Scripts* Directory

This directory contains all of the individual scripts for reading each of the separate data files and creating the graphs. If you are interesting in using some of the code for calculating the Dirichlet distribution and other statistics, you should find the functions you need in the `BetaDirFunctions.R` script.

### *FormattedData* Directory

This directory contains `.csv` files from each of the co-authors for the different data sets.  In these files, each row is a species, and there are columns for the number of museum records and the number of field records. For the four Walden Pond data sets, there are no field records, but qualitative estimates of abundance of each species.

Although these files are all in the same format, the underlying data are extremely different for each data set. Carefully consult the main text and the supplement for the details of how these data sets were constructed and curated. Some of them may not be appropriate for your purposes. Keep in mind that some of these data sets represent years of field work and many hours spent working with musuem collections. Be respectful of this work by citing the original papers wherever possible, and not just the summary MEE citation. The repository contains contact information for each author so you can contact them if you need clarification or more details.

### *DataObjects* Directory

This directory contains data frames for each object stored in the RDS file format. These objects are then batch processed to extract standard statistics and graphics for each data set.

### *Output* Directory

This directory contains graphic components rendered as `.jpeg`, `.pdf` and `.tiff` files. There is also a single RDS object, `summary_stats`, that contains all of the summary statistics in Table 1 of the MEE paper.



