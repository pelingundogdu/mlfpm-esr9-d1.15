In order to generate the KEGG gene-pathway databse using geneSFC:
- Download the genSCF tool from https://github.com/genescf
- run `./prepare_database -db=KEGG -org=mmu`
- copy data from `class/lib/db/mmu` to the project data folder.
- note that other pathway databases can be used (such as reactome, wikipathways etc)