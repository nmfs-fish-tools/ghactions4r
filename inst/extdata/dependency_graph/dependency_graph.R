#devtools::install_github("datastorm-open/DependenciesGraphs")
#install.packages("visNetwork")

library(visNetwork)
library(ghactions4r)
library(rvest)
library(dplyr)

webpage <- rvest::read_html(
  x = "https://github.com/nmfs-fish-tools/ghactions4r/network/dependents"
)

gha_links <- webpage %>%
  html_nodes("details-menu") %>%
  html_nodes(".select-menu-item") %>%
  html_attr("href")

gha_names <- webpage %>%
  html_nodes("details-menu") %>%
  html_nodes(".select-menu-item-text") %>%
  html_text() 

gha_names <- sapply(1:length(gha_names), function(x) gsub("[\r\n]","/", gha_names[x]))
gha_names <- sapply(1:length(gha_names), function(x) strsplit(gha_names[x],"/")[[1]][6])

gha_data <- list()
for (i in 1:length(gha_names)){
  webpage <- rvest::read_html(
    x = paste0("https://github.com", gha_links[i])
  )
  
  gha_data[[i]] <- webpage %>%
    html_nodes(".Box-row") %>%
    html_nodes("span") %>%
    html_nodes(".text-bold") %>%
    html_attr("href")
}
names(gha_data) <- gha_names

# Plot dependency graph
dep_data <- DependenciesGraphs::envirDependencies("package:ghactions4r")
dep_label <- c(gha_names, unique(unlist(gha_data)))
dep_data$Nomfun <- data.frame(
  id = 1:length(dep_label),
  label = dep_label
)

dep_data$fromto <-data.frame(
  from = NA,
  to = NA
)
for (i in 1:length(gha_data)){
  for (j in 1:length(gha_data[[i]])) {
    from_id <- dep_data$Nomfun$id[dep_data$Nomfun$label == names(gha_data)[i]]
    to_id <- dep_data$Nomfun$id[dep_data$Nomfun$label == gha_data[[i]][j]]
    dep_data$fromto <- rbind(dep_data$fromto, c(from_id, to_id))
  }
}

plot(dep_data)

