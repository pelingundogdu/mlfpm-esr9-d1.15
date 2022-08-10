### The external datasets which are uploaded into data/external folder with specified {FOLDER_NAME}

```sh
data/external
------------
    │
    ├── FOLDER NAME                      <- experiment name
    ├── PAPER NAME                       <- the paper name
    ├── PAPER LINK                       <- the URL link of paper
    ├── ACCESSION NUMBER                 <- the accession number of using dataset
    ├── URL                              <- the url link of the dataset
    ├── INFO                             <- preprocessed steps of authors
    └── implemented into author version  <- the final preprocessed steps
```
---------------------------

```sh
FOLDER NAME                     : exper_mouse
PAPER NAME                      : Using neural networks for reducing the dimensions of single-cell RNA-Seq data
PAPER LINK                      : https://doi.org/10.1093/nar/gkx681
ACCESSION NUMBER                : Shared in 'Supplementaty Table 1' in 'Supplementary Data' section
URL                             : http://sb.cs.cmu.edu/scnn/
INFO                            : Shared the ***TPM*** normalization version by authors.
implemented into author version : **sample wise and gene normalization**
```
---------------------------

```sh
FOLDER NAME                     : exper_pbmc
PAPER NAME                      : Massively parallel digital transcriptional profiling of single cells
PAPER LINK                      : https://www.nature.com/articles/ncomms14049
ACCESSION NUMBER                : SRP073767

URL                             : https://github.com/PaulingLiu/SciBet/tree/master/example.data
INFO                            : Shared by author, ***no information about reproccessing steps***
implemented into author version : ***sample wise + log1p***
```
---------------------------

```sh
FOLDER NAME                     : exper_melanoma
PAPER NAME                      : A Cancer Cell Program Promotes T Cell Exclusion and Resistance to Checkpoint Blockade
PAPER LINK                      : https://doi.org/10.1016/j.cell.2018.09.006
ACCESSION NUMBER                : GSE115978
URL                             : http://scibet.cancer-pku.cn/reference.rds.gz
                                  http://scibet.cancer-pku.cn/query.rds.gz  
INFO                            : Shared by author, ***no information about reproccessing steps***
                                  assuming TPM, pseudo value one to handle 0 values + filtering gene space
                                  because the shared version is different than TPM version shared in GEO website
                                  GEO TPM version ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE115978
implemented into author version : ***log1p***
```
---------------------------

**The final version of dataset after our implementations which defined in "implemented into author version" are located into data/processed/{FOLDER NAME}**
