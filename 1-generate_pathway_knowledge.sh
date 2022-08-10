## Genome Wide annotation
## https://bioconductor.org/packages/3.12/data/annotation/

## hsa --> homo sapiens(human), org.Hs.eg.db
## mmu --> mus musculus(mouse), org.Mm.eg.db

#!/bin/bash

echo "Exporting signaling pathway information from hipathia --- scripts/pathway_layer_data/1.1-pg-pathway-from-hipathia.r executing..."
Rscript scripts/pathway_layer_data/1.1-pg-pathway-from-hipathia.r -sp hsa -src hipathia
Rscript scripts/pathway_layer_data/1.1-pg-pathway-from-hipathia.r -sp mmu -src hipathia

echo "Processing the pathway list, removing disease related pathways --- scripts/pathway_layer_data/1.2-pg-remove-disease-cancer.py executing..."
python scripts/pathway_layer_data/1.2-pg-remove-disease-cancer.py -sp hsa -src hipathia
python scripts/pathway_layer_data/1.2-pg-remove-disease-cancer.py -sp mmu -src hipathia

echo "Exporting gene list based on processed pathway list in 1.2-pg-remove-disease-cancer.py --> scripts/pathway_layer_data/1.3-pg-gene-from-hipathia.r executing..."
Rscript scripts/pathway_layer_data/1.3-pg-gene-from-hipathia.r -sp hsa -src hipathia
Rscript scripts/pathway_layer_data/1.3-pg-gene-from-hipathia.r -sp mmu -src hipathia

echo "Converting entrex id value into gene symbol -->  scripts/pathway_layer_data/1.4-pg-gene-id-entrez-converter.r executed!!"
Rscript scripts/pathway_layer_data/1.4-pg-gene-id-entrez-converter.r -sp hsa -src hipathia -ga org.Hs.eg.db
Rscript scripts/pathway_layer_data/1.4-pg-gene-id-entrez-converter.r -sp mmu -src hipathia -ga org.Mm.eg.db

echo "Creating prior biological knowledge information which will be integrated into proposed network in first hidden layer (pathways) --> scripts/pathway_layer_data/1.5-pg-creating-biological-layer.py executing..."
python scripts/pathway_layer_data/1.5-pg-creating-biological-layer.py -sp hsa -src hipathia
python scripts/pathway_layer_data/1.5-pg-creating-biological-layer.py -sp mmu -src hipathia

echo "Creating prior biological knowledge information which will be integrated into proposed network in first hidden layer (circuits) --> scripts/pathway_layer_data/1.6-pg-creating-biological-layer-circuits.py executing..."
python scripts/pathway_layer_data/1.6-pg-creating-biological-layer-circuits.py -sp hsa -src hipathia

echo "PATHWAY INFORMATION EXPORTED!!!"
echo "Exporting data/processed/pbk_layer_{BIO_SOURCE} files"
python scripts/bio_layer_data/1.0-pg-exporting-bio-layer.py