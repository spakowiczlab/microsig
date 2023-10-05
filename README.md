# microsig   <img src="man/microsig_hex.png" align="right" width="100" />

## Microbial Signatures

[![DOI](https://zenodo.org/badge/698243710.svg)](https://zenodo.org/badge/latestdoi/698243710)

## Overview

This package contains functions to calculate microbial signature scores from (1) an abundance matrix, (2) a list of 'up-regulated' microbes, and (3) a list of 'down regulated' microbes. It includes functions designed to work with input lists from BugSigDB outputs. 

`getSigList` Given a single cell value from BugSigDB output in the column 'MetaPhlAn.taxon.names', returns a list of microbe names containing the string after the last "|" in each comma separated Metaphlan taxonomic name

`microbeEntries` Given the name of a particular microbe signature followed by '_up' or '_down' will return the microbes within a desired signature group in the format "x__microbe name". If query is passed "all" function will return all the signature groups.

`calcMicroSigScore` Function to calculate microbe signature scores given a set of up and down regulated microbes and the relative abundances of microbe per sample. Given a data frame where columns are microbes and rows are samples, with the first column named 'sample' and character vectors listing microbes in given signature that are 'up-regulated' and 'down regulated', empty if none, returns a data frame with samples and corresponding microbe signature scores.

$$S_b = \frac{1}{|M_{pos}| + |M_{neg}|} \left( \sum_{m \in M_{pos}}X_{mb}-\sum_{m \in M_{neg}}X_{mb} \right)$$

where:
* $S_b$ is the microbial signature score 
* $X_{mb}$ is the expression of microbe *m* in sample *b*
* $M_{pos}$ and $M_{neg}$ are the set of 'up regulated' and 'down regulated' microbes 

## Installation

``` r
# Currently available as the development version on GitHub
install.packages("devtools")
devtools::install_github("spakowiczlab/microsig")
```

## References
1. Geistlinger L, Mirzayi C, Zohra F, Azhar R, Elsafoury S, Grieve C, Wokaty J, Gamboa-Tuz SD, Sengupta P, Hecht I, Ravikrishnan A, Gonçalves RS, Franzosa E, Raman K, Carey V, Dowd JB, Jones HE, Davis S, Segata N, Huttenhower C, Waldron L: BugSigDB captures patterns of differential abundance across a broad range of host-associated microbial signatures. Nat. Biotechnol. 2023. https://doi.org/10.1038/s41587-023-01872-y (download citation as .ris file)

2. Jones M, Detomaso D, Ashuach T, Rosen Y (2022). VISION: Functional interpretation of single cell RNA-seq latent manifolds. https://yoseflab.github.io/VISION, https://github.com/yoseflab/VISION.
