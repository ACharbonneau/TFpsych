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

args <- commandArgs()

rmarkdown::render('TFpsych/3.1_Motif_Count.Rmd', input= args[1] output_file = args[1].html )
