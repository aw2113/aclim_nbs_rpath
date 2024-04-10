# First ever balance of NBS model March 29, 2024

require("Rpath")
source("rpath_graphs.R")

Ebase <- "model/nbs_2010_base.csv"  # Base biomass, production, fishing, etc.
Ediet <- "model/nbs_2010_diet.csv"  # Diet matrix
Eped  <- "model/nbs_2010_pedigree.csv"   # Data pedigree = quality of input data
Estz  <- "model/nbs_stanzas.csv"   # Stanzas
Estg  <- "model/nbs_stanza_groups.csv" # Stanza groups

# Setup Base Ecopath params
unbal.params <- read.rpath.params(Ebase, Ediet, Eped, Estg, Estz) # unbalanced
# unbalanced Ecopath
unbal <- rpath.stanzas(unbal.params)
# try to balance
bal <- rpath(unbal) # balanced

juv_groups <- c("pollock_juv","pcod_juv","arrowtooth_juv","gr_turbot_juv",
                "halibut_juv")

write.Rpath(bal, "C:/Users/andy.whitehouse/Work/Andy/REEM/ACLIM/NBS/Rpath/nbs_notbal2.csv",
            morts=F)
print(bal)

webplot(bal, labels=TRUE, fleets=TRUE)
