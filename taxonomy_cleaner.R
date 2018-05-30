library(tidyverse)

import_taxa <- readxl::read_excel("~/Documents/GitHub/taxonomy/taxonomy.xlsx")
import_order <- readxl::read_excel("~/Documents/GitHub/taxonomy/taxonomy.xlsx", sheet = 2)
import_questions <- readxl::read_excel("~/Documents/GitHub/taxonomy/taxonomy.xlsx", sheet = 3)

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

questions <- gather(import_questions, question, exists, -Proposal) %>% na.omit()
taxonomies <- gather(import_taxa, group, taxonomy, -Proposal) %>% na.omit()

n_distinct(df$question)
n_distinct(df$taxonomy)

df <- inner_join(questions, taxonomies, by = "Proposal") %>% select(-exists, -group) %>% distinct()


library(networkD3)
E1 <- data.frame(from=as.numeric(factor(edges$from))-1, to=as.numeric(factor(edges$to))-1)
N1 <- cbind(idn=factor(nodes$media, levels=nodes$media), nodes)
forceNetwork(Links=E1, Nodes=N1, Source="from", Target="to", NodeID="idn", Group="type.label", linkWidth=1, linkColour="#afafaf", fontSize=12, zoom=T, legend=T,Nodesize=6, opacity=.8, charge=-300, width=600, height=600)