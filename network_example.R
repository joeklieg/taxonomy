library(visNetwork)
library(igraph)

links2 <- taxonomies %>%
        rename(from = Proposal, to = taxonomy) %>%
        select(-group)

nodes2 <- read.csv("test.csv")

g <- graph_from_data_fram(links2, directed = FALSE, vertices = nodes2)
V(g)
E(g)
ecount(g)


ggraph(g, layout = "with_kk") +
        geom_edge_link(aes(alpha = weight)) +
        geom_node_point()



nodes <- read.csv("~/Downloads/polnet2017/Data files/Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
links <- read.csv("~/Downloads/polnet2017/Data files/Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)

nodes2$shape <- "dot"
nodes2$shadow <- TRUE
nodes2$title <- nodes2$question
nodes2$label <- nodes2$question
nodes$size <- 4
nodes$borderWidth <- 2

nodes$color.background <- c("slategrey", "tomato", "gold")[nodes$media.type]
nodes$color.border <- "black"
nodes$color.highlight.background <- "orange"
nodes$color.highlight.border <- "darkred"

links2$width <- 2
links2$color <- "gray"
links2$arrows <- "middle"
links$smooth <- FALSE
links$shadow <- FALSE

visNetwork(nodes2, links2)

visNetwork(nodes, links) %>%
        visNodes(color = list(hover = "green")) %>%
        visInteraction(hover = TRUE)

unique(nodes2$question)
