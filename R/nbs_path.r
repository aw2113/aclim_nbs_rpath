# First ever balance of NBS model March 29, 2024

require("Rpath")
source("rpath_graphs.R")

Ebase <- "model/nbs_2010_base.csv"  # Base biomass, production, fishing, etc.
Ediet <- "model/nbs_2010_diet.csv"  # Diet matrix
# Eped  <- "model/nbs_2010_pedigree.csv"   # Data pedigree = quality of input data
Estz  <- "model/nbs_stanzas.csv"   # Stanzas
Estg  <- "model/nbs_stanza_groups.csv" # Stanza groups

# Setup Base Ecopath params
unbal.params <- read.rpath.params(Ebase, Ediet, Estg, Estz) # unbalanced
# unbalanced Ecopath
unbal <- rpath.stanzas(unbal.params)
# try to balance
bal <- rpath(unbal) # balanced
