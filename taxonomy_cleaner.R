library(tidyverse)

import_taxa <- readxl::read_excel("~/Documents/GitHub/taxonomy/taxonomy.xlsx")
import_order <- readxl::read_excel("~/Documents/GitHub/taxonomy/taxonomy.xlsx", sheet = 2)

import_order <- import_order %>% rename(color_preference = X__1)
import_order$broadest[1:16] <- "Microbes"
import_order$broadest[17:24] <- "Fungi"
import_order$broadest[25:27] <- "Plants"
import_order$broadest[28:38] <- "Metazoa"
import_order$color_preference[3:14] <- "Red/Purple"
import_order$color_preference[17:24] <- "Browns"
import_order$color_preference[25:27] <- "Greens"
import_order$color_preference[28:33] <- "Blues"
import_order$color_preference[34:38] <- "Turquoise"

write_csv(import_order, "~/Documents/GitHub/taxonomy/new_taxa.order.csv")
