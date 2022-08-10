Project structure
--------

    ├── environment.yml              <- The environment file
    │
    ├── README.md                    <- The top-level README for developers using this project.
    │
    ├── data
    │   ├── external                 <- Data from third party sources.
    │   ├── processed                <- The final, canonical data sets for modeling.
    │   └── raw                      <- The original, immutable data dump.
    │
    ├── models                       <- Trained models, model predictions, or model summaries
    │   ├── NN                       <- training and testing models
    │   └── CV                       <- cross-validation performance result
    │
    ├── notebooks                    <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                                   the creator's initials, and a short `-` delimited description, 
    │                                   e.g. `1.0-jqp-initial-data-exploration`
    │
    ├── references                   <- Data dictionaries, manuals, and all other explanatory materials
    │
    ├── reports                      <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   ├── activation               <- pathways activation results
    │   ├── CV                       <- the results of cross-validation performance
    │   ├── encoding                 <- the results of encoding infomation
    │   ├── figures                  <- Generated graphics and figures to be used in reporting
    │   └── retrieval                <- the results of retrieval performance
    │
    └── scripts                      <- The helper scripts
--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>

## Codes in this repository covers the content from two articles, which are called Article#1 and Article#2. 

### Article Titles and Links
**Article#1** -- Integrating pathway knowledge with deep neural networks to reduce the dimensionality in single-cell RNA-seq data ( <a target="_blank" href="https://doi.org/10.1186/s13040-021-00285-4">10.1186/s13040-021-00285-4</a> )

**Article#2** -- Enhanced analysis and validation performances with multiple dataset to annotate cell type ( <a target="_blank" href="https://doi.org/10.5281/zenodo.5542325">10.5281/zenodo.5542325</a> )

--------

**Usage example,**

- 2-layer signaling pathway network definition with mouse - learning set
```sh
... $ python notebooks/4.0-pg-model.py
            -design pathways_2_layer
            -first_hidden_layer_pbk pbk_layer_mmu_sig.txt
            -first_hidden_layer_dense 0
            -second_hidden_layer True
            -optimizer SGD
            -activation tanh
            -ds processed/exper_mouse/mouse_learning_sw_gw.pck
            -analysis clustering
            -filter_gene_space False
            -hp_tuning False
```
--------

