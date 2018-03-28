library(tidyverse)
library(shiny)
library(colourpicker)
library(plotly)

new_taxa_order <- read_csv("~/Documents/GitHub/taxonomy/new_taxa.order.csv")
phylum <- sort(unique(new_taxa_order$`current taxonomy`))
kingdom <- sort(unique(new_taxa_order$broadest))
taxa <- sort(unique(new_taxa_order$`broader taxonomy`))

ui <- fluidPage(
        h1("Taxonomy Vizualizer"),
        sidebarPanel(
                selectInput(inputId = "kingdom",
                            label = "Kingdom:",
                            choices = kingdom,
                            selected = "Microbes",
                            multiple = TRUE),
                selectInput(inputId = "taxa",
                            label = "Taxa:",
                            choices = taxa,
                            selected = "Viruses",
                            multiple = TRUE),
                selectInput(inputId = "phylum",
                            label = "Phylum:",
                            choices = phylum,
                            selected = "Viruses",
                            multiple = TRUE),
                colourInput(inputId = "virus_color",
                            label = "Virus Color",
                            value = "yellow"),
                colourInput(inputId = "archaea_color",
                            label = "Archaea Color",
                            value = "orange"),
                colourInput(inputId = "bacteria_color",
                            label = "Bacteria Color",
                            value = "purple"),
                downloadButton("download_data")
        ),
        mainPanel(

        )


)

server <- function(input, output) {

        }

shinyApp(ui, server)