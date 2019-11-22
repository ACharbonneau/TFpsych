# This runs 3.1_Motif_Count.Rmd on whatever files you input


# Install function for packages
packages<-function(x){
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
packages(knitr)
packages(rmarkdown)

setwd("/Users/amanda/BrainTF")

datalist <- list.files(pattern = "*.bed")

for( folder in datalist){
    rmarkdown::render('TFpsych/3.1_Motif_Count.Rmd', output_file = paste( "../MotifCounts/",folder, ".html", sep=""),
                  params = list(fimo = paste( folder, "/fimo.tsv", sep=""),
                                cons = paste( folder, "/", folder, ".cons", sep=""),
                                bed =  paste( folder, "/", folder, sep="")))
}
