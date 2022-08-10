#!/bin/bash

analysis_var='encoding'
optimizer_var='Adam' 
activation_var='relu'
tuning='False'
filter_space='False'
ds_var='processed/exper_melanoma/query_log1p.pck'
#pathway
pbk_var='pbk_layer_hsa_sig.txt'
pbk_info='pathways'

echo "PERFORMANCE ANALYSIS for MELANOMA EXPERIMENT"
############################################### MELANOMA EXPERIMENT ###############################################
# 1-LAYER SIGNALING
python notebooks/4.0-pg-model.py \
     -design ${pbk_info}_1_layer \
     -first_hidden_layer_pbk $pbk_var \
     -first_hidden_layer_dense 0 \
     -second_hidden_layer False \
     -optimizer $optimizer_var \
     -activation $activation_var \
     -ds $ds_var \
     -analysis $analysis_var \
     -filter_gene_space $filter_space \
     -hp_tuning $tuning

# 2-LAYER SIGNALING
python notebooks/4.0-pg-model.py \
    -design ${pbk_info}_2_layer \
    -first_hidden_layer_pbk $pbk_var \
    -first_hidden_layer_dense 0 \
    -second_hidden_layer True \
    -optimizer $optimizer_var \
    -activation $activation_var \
    -ds $ds_var \
    -analysis $analysis_var \
    -filter_gene_space $filter_space \
    -hp_tuning $tuning
    
############################################### MELANOMA EXPERIMENT ###############################################