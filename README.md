
MRPC builds on existing PC algorithms and learns a causal network with increased accuracy.  The inferred causal network contains directed and undirected edges, with the direction indicating causality.  For genomic data, MRPC determines edge direction under the principle of Mendelian randomization when genotype and molecular phenotype (e.g. gene expression) data are both available at the individual level. Nodes in the inferred network may be a genotype or a molecular phenotype.  
Development of the R package MRPC is at https://github.com/audreyqyfu/mrpc, and official releases are available on CRAN: https://cran.r-project.org/web/packages/MRPC/index.html.

References:

1. Md. Bahadur Badsha, Audrey Qiuyan Fu (2019) Learning causal biological networks
with the principle of Mendelian randomization. Frontiers in Genetics. 10:460.

2. Md. Bahadur Badsha, Evan A Martin, Audrey Qiuyan Fu (2021) MRPC: An R package for inference of causal graphs.  Frontiers in Genetics. 12:651812.

3. Kvamme, J., Badsha, M. B., Martin, E. A., Wu, J., Wang, X., & Fu, A. Q. (2025). Causal network inference of cis-and trans-gene regulation of expression quantitative trait loci across human tissues. Genetics, 230(2), iyaf064.

## Installation

### 1. Installation of the current, released version from CRAN.

Official releases are available on CRAN.  To install, run the following command line in R:
```
R> install.packages ("MRPC")
```
This line will tell you what other R packages (the "dependencies") you need to install before installing MRPC. 

We have found that it may be easier to first install the following R packages from Bioconductors:
```
R> if (!requireNamespace ("BiocManager", quietly = TRUE))
    install.packages ("BiocManager")
R> BiocManager::install ('AnnotationDbi')
R> BiocManager::install ('GO.db')
R> BiocManager::install ('graph')
R> BiocManager::install ('impute')
R> BiocManager::install ('preprocessCore')
R> BiocManager::install ('RBGL')
R> BiocManager::install ('Rgraphviz')
```

For the dependencies available on CRAN, you may use the following command line for installation (change _packagename_ to the name of the package to be installed, e.g, bnlearn, pcalg, etc.) :
```
R> install.packages ("packagename")
```

Once these packages are installed, run the following line again to install MRPC:
```
R> install.packages ("MRPC")
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
R> install.packages ("MRPC_xxx.tar.gz", repos = NULL, type="source")
```
### 3. Installation from GitHub.

First install the R package devtools available on CRAN, if it is not already installed. This package provides function `install_github()` that enables installing packages directly from github with the following command.

Invoke R and then type with the following command:
```
R> install.packages ("devtools")
R> library (devtools)
# install R packages that MRPC depends on before running the next line 
# see details below
R> install_github ("audreyfulab/mrpc")
```
Again, this will show what dependencies you need to install before installing MRPC.

## Using MRPC
After installation, load the MRPC package into R:
```
R> library (MRPC)
```
Bring up the documentation of the package:
```
R> library (help=MRPC)
```

