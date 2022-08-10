#!/bin/bash

analysis_var='performance'
# analysis_var='clustering'
# analysis_var='retrieval'
optimizer_var='SGD'
activation_var='tanh'
tuning='False'
filter_space='True'
ds_var='processed/exper_mouse/mouse_learning_sw_gw.pck'
#pathway
pbk_var='pbk_layer_mmu_sig.txt'
pbk_info='pathways'

date

echo $analysis_var" ANALYSIS for MOUSE EXPERIMENT"
############################################### MOUSE EXPERIMENT ###############################################
# 1-LAYER DENSE100
python notebooks/4.0-pg-model.py \
    -design 1_layer_dense \
    -first_hidden_layer_pbk None \
    -first_hidden_layer_dense 100 \
    -second_hidden_layer False \
    -optimizer $optimizer_var \
    -activation $activation_var \
    -ds $ds_var \
    -analysis $analysis_var \
    -filter_gene_space False \
    -hp_tuning $tuning

# 1-LAYER SIGNALING
python notebooks/4.0-pg-model.py \
    -design ${pbk_info}_1_layer \
    -first_hidden_layer_pbk $pbk_var \
    -first_hidden_layer_dense 0 \
    -second_hidden_layer False \
    -optimizer $optimizer_var \
    -activation $activation_var \
    -ds $ds_var\
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
    
# 1-LAYER SIGNALING + 100dense
python notebooks/4.0-pg-model.py \
    -design ${pbk_info}_with_100_dense_1_layer \
    -first_hidden_layer_pbk $pbk_var \
    -first_hidden_layer_dense 100 \
    -second_hidden_layer False \
    -optimizer $optimizer_var \
    -activation $activation_var \
    -ds $ds_var \
    -analysis $analysis_var \
    -filter_gene_space $filter_space \
    -hp_tuning $tuning

# 1-LAYER PPI + 100dense
python notebooks/4.0-pg-model.py \
    -design ppi_with_100_dense_1_layer \
    -first_hidden_layer_pbk pbk_layer_mmu_ppi.txt \
    -first_hidden_layer_dense 100 \
    -second_hidden_layer False \
    -optimizer $optimizer_var \
    -activation $activation_var \
    -ds $ds_var \
    -analysis $analysis_var \
    -filter_gene_space $filter_space \
    -hp_tuning $tuning
    
# 1-LAYER PPITF + 100dense
python notebooks/4.0-pg-model.py \
    -design ppitf_with_100_dense_1_layer \
    -first_hidden_layer_pbk pbk_layer_mmu_ppitf.txt \
    -first_hidden_layer_dense 100 \
    -second_hidden_layer False \
    -optimizer $optimizer_var \
    -activation $activation_var \
    -ds $ds_var \
    -analysis $analysis_var \
    -filter_gene_space $filter_space \
    -hp_tuning $tuning


if [ $analysis_var==retrieval]
then
    python scripts/retrieval-summary.py ./reports/retrieval/exper_mouse/
    echo retrival analysis completed!!
fi

if [ $analysis_var==clustering ]
then
    python scripts/clustering_result.py
    echo clustering analysis completed!!
fi

if [ $analysis_var==performance ]
then 
    echo performance analysis completed!!
fi

############################################### MOUSE EXPERIMENT ###############################################