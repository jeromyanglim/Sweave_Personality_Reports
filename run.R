# Title: run.R
# File Name: run.R
# Version: 0.1
# Description:
# Author: Jeromy Anglim
# Date Created: 29/11/2010


source("main.R", echo = TRUE)

exportReport <- function(x) {
	id <<- x
	fileStem <- "Report_Template"
	file.copy("Report_Template.Rnw",
			paste(".output/", fileStem, "_ID", id, ".Rnw", sep =""),
			overwrite = TRUE)
	file.copy("Sweave.sty", ".output/Sweave.sty", overwrite = TRUE)
	setwd(".output")
	Sweave(paste(fileStem, "_ID", id, ".Rnw", sep =""))
	tools::texi2dvi(paste(fileStem, "_ID", id, ".tex", sep =""), pdf = TRUE)
	setwd("..")
}

