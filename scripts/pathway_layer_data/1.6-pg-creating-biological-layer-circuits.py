#!/usr/bin/env python

'''
DESCRIPTION 
-----------
    Creating prior biological knowledge matrix with circuits. The matrix will implemented into NN design in first hidden layer.

USAGE
-----
    [PROJECT_PATH]/$ python scripts/pathway_layer_data/1.6-pg-creating-biological-layer_circuits.py

RETURN
------
    pbk_circuit_hsa_sig.txt : txt file
        gene-circuits matrix
        
EXPORTED FILE(s) LOCATION
-------------------------
    ./data/processed/pbk_circuit_hsa_sig.txt
'''

import os
import argparse
import sys
sys.path.append('./')
import glob
import pandas as pd
import numpy as np
from scripts import config as src

def create_biological_layer_circuits(species, source, pbk_ = 'sig'):
    sys.path.append('./')
    from scripts import config as src

    df_entrez_symbol = pd.read_csv(os.path.join(src.DIR_DATA_PROCESSED, species, source, 'entrez_and_symbol.csv'))
    print(df_entrez_symbol.shape)
    print(df_entrez_symbol.head())

    print('Checking NA values, number of NA values, ', len(df_entrez_symbol.loc[df_entrez_symbol['symbol'].isna()]))

    df_sig = pd.read_csv(f'./data/processed/pbk_layer_{species}_sig.txt')
    print(df_sig.shape)
    
    for i_pathway in sorted(df_sig.columns[1:]):    
        # Reading selected pathways which shows the gene relation for each circuits
        df_i_pathway = pd.read_csv(os.path.join(src.DIR_DATA_PROCESSED, species, source, f'details/{i_pathway}_gene_list.txt'), index_col=0).fillna(value=0)
        df_entrez_symbol = pd.merge(left=df_entrez_symbol, right=df_i_pathway, left_on='gene_id', right_index=True, how='left')
        df_entrez_symbol.fillna(value=0, inplace=True)

    # Updating 'symbol' values as lowercase
    df_entrez_symbol['symbol'] = df_entrez_symbol['symbol'].str.lower()    
    df_entrez_symbol.drop(columns=['gene_id'], inplace=True)

    # EXPORTING - the prior biological knowledge layer
    print('The prior biological knowledge layer EXPORTED!! - {}'.format(os.path.join(src.DIR_DATA_PROCESSED, f'pbk_circuit_{species}.txt')))
    df_entrez_symbol.to_csv(os.path.join(src.DIR_DATA_PROCESSED, f'pbk_circuit_{species}_{pbk_}.txt'), index=False)
    print(df_entrez_symbol.shape)
    
if __name__=='__main__':
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-sp', '--species', help='specify the species, the location of species in ./data/raw/{SPECIES}')
    parser.add_argument('-src', '--source', help='specify the source, the location of source in ./data/raw/{SPECIES}/{SOURCE}')
    parser.add_argument('-ga', '--genome_annotation', help='specify genome wide annotition package', default=None)
    parser.add_argument('-pbk', '--pbk_', help='prior biological knowledge', default='sig')

    if len(sys.argv)==1:
        parser.print_help(sys.stderr)
        sys.exit(1)
        
    args = parser.parse_args()
    create_biological_layer_circuits(args.species, args.source)