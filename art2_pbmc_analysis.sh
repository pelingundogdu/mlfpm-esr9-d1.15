#!/bin/bash

analysis_var='evaluate_rskf'
optimizer_var='Adam'
activation_var='relu'
tuning='False'
filter_space='False'
ds_var='processed/exper_pbmc/pbmc_sw_log1p.pck'
#pathway
pbk_var='pbk_layer_hsa_sig.txt'
pbk_info='pathways'

date

echo "PERFORMANCE for PBMC EXPERIMENT"
############################################### PBMC EXPERIMENT ###############################################
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
# ############################################### PBMC EXPERIMENT ###############################################

if [ $analysis_var==performance ]
then 
    echo performance analysis completed!!
fi

date