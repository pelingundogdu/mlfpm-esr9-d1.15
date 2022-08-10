## Genome Wide annotation
## https://bioconductor.org/packages/3.12/data/annotation/

## hsa --> homo sapiens(human), org.Hs.eg.db
## mmu --> mus musculus(mouse), org.Mm.eg.db

#!/bin/bash

date

echo "PREPROCESSING EXPERIMENTS' DATASETS"
# $ python notebooks/2.0-pg-preprocessing-dataset.py -exp {EXPERIMENT NAME}
#                                                    -ds  {DATASET NAME} 
#                                                    -sc  {SCALER, StandardScaler(ss), MinMaxScaker(mms), Log1p} 
#                                                    -sw  {SAMPLE-WISE NORMALIZATION}
#                                                    -gw  {GENE-WISE NORMALIZATION}
#                                                    -tci {TARGET COLUMN INDEX}
#                                                    -ofn {OUTPUT FILE NAME}

echo "PREPROCESSING of EXPERIMENT MELANOMA DATASET"
python notebooks/2.0-pg-preprocessing-dataset.py \
    -exp exper_melanoma \
    -ds reference.pck \
    -sw False \
    -gw False \
    -sc log1p \
    -tci -1 \
    -ofn reference
    
python notebooks/2.0-pg-preprocessing-dataset.py \
    -exp exper_melanoma \
    -ds query.pck \
    -sw False \
    -gw False \
    -sc log1p \
    -tci -1 \
    -ofn query

echo "PREPROCESSING of EXPERIMENT MOUSE DATASET"
python notebooks/2.0-pg-preprocessing-dataset.py \
    -exp exper_mouse \
    -ds 1-3_integrated_NNtraining.pck \
    -sw True \
    -gw True \
    -sc None \
    -tci 0 \
    -ofn mouse_learning
    
python notebooks/2.0-pg-preprocessing-dataset.py \
    -exp exper_mouse \
    -ds 3-33_integrated_retrieval_set.pck \
    -sw True \
    -gw True \
    -sc None \
    -tci 0 \
    -ofn mouse_retrieval
    
python notebooks/2.0-pg-preprocessing-dataset.py \
    -exp exper_mouse \
    -ds 3-33_integrated_retrieval_set_signaling.pck \
    -sw True \
    -gw True \
    -sc None \
    -tci 0 \
    -ofn mouse_retrieval_signaling

echo "PREPROCESSING of EXPERIMENT PBMC DATASET"
python notebooks/2.0-pg-preprocessing-dataset.py \
    -exp exper_pbmc \
    -ds Immune.pck \
    -sw True \
    -gw False \
    -sc log1p \
    -tci -1 \
    -ofn pbmc