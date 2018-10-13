
MRPC builds on existing PC algorithms and learns a causal network with increased accuracy.  The inferred causal network contains directed and undirected edges, with the direction indicating causality.  For genomic data, MRPC determines edge direction under the principle of Mendelian randomization when genotype and molecular phenotype (e.g. gene expression) data are both available at the individual level. Nodes in the inferred network may be a genotype or a molecular phenotype.  
The R package MRPC is available at https://github.com/audreyqyfu/mrpc.

## Installation

### 1. Installation of the most recent version from GitHub.

First install the R package devtools available on CRAN, if it is not already installed. This package provides function `install_github()` that enables installing packages directly from github with the following command.

Invoke R and then type with the following command:
```
R> install.packages ("devtools")
R> library (devtools)
#install R packages that MRPC depends on before running the next line 
#see details below
R>install_github ("audreyqyfu/mrpc")
```
MRPC depends on several R packages from CRAN and from Bioconductor.  It is likely that some of these packages are not installed on your computer.  If the R package is available on CRAN, you may use the following command line for installation (change _packagename_ to the name of the package to be installed, e.g, bnlearn, pcalg, etc.) before running function `install_github`:
```
R> install.packages("packagename")
```
**_Note that the package git2r is one of the required packages.  However, currently (as of July 2018) its binary release for OS X is behind its source version and its Windows binary release. If you are using OS X, you need to install the slightly-behind binary release for OS X._**

The following Bioconductor packages also need to be installed before running function `install_github`:
```
R> source ('https://bioconductor.org/biocLite.R')
R> biocLite ('RBGL')
R> biocLite ('Rgraphviz')
R> biocLite ('GO.db')
R> biocLite ('impute')
R> biocLite ('preprocessCore')
```
### 2. Installation from the source of a released package.

Download the package source MRPC_xxx.tar.gz.  

In Terminal, navigate to the directory where the package is stored, and run the following command line:
```bash
$ R CMD INSTALL MRPC_xxx.tar.gz
```
Again, you may need to first install the Bioconductor packages that MRPC depends on using the instructions above.
Alternatively, you may also run the following command line in R, after changing the working directory to where MRPC_xxx.tar.gz is stored on your computer:
```
R> install.packages("MRPC_xxx.tar.gz", repos = NULL, type="source")
```
## Using MRPC
After installation, load the MRPC package into R:
```
R> library (MRPC)
```
Bring up the documentation of the package:
```
R> library (help=MRPC)
```

