# ensures that at least a case is printed if nothing else is specified
if(!any(ls() %in% "ids")) ids <- 1  

# Settings and import statements
options(stringsAsFactors = FALSE)
library(psych)
library(ggplot2)
source("lib/vp.layout.R")

# Import Data
ipip <-read.delim("data/ipip.tsv")

ipipmeta <-read.delim("meta/ipipmeta.tsv")

ipipscales <- read.delim("meta/ipipscales.tsv")

# Create scoring key (
# 1 means not reverse
# -1 means reverse 
# 0 means not included in scale
ipipmeta[,ipipscales$scale] <- sapply(ipipscales$scale, function(X)
			ifelse(ipipmeta$scale == X, ipipmeta$reverse, 0))

# Score test and get psychometric information
ipipstats <- psych::score.items(ipipmeta[,ipipscales$scale], 
		ipip[,ipipmeta[,"variable"]],
		min = 1, max = 5)

ipip <- cbind(ipip, ipipstats$score)


# summary table for ipip
ipipsummary <- ipipmeta 
ipipsummary$mean <-	sapply(ipip[,ipipsummary$variable], mean)  
ipipsummary$sd <-	sapply(ipip[,ipipsummary$variable], sd)
ipipsummary$is1 <-	sapply(ipip[,ipipsummary$variable], function(X) mean(X==1)*100)
ipipsummary$is2 <-	sapply(ipip[,ipipsummary$variable], function(X) mean(X==2)*100)
ipipsummary$is3 <-	sapply(ipip[,ipipsummary$variable], function(X) mean(X==3)*100)
ipipsummary$is4 <-	sapply(ipip[,ipipsummary$variable], function(X) mean(X==4)*100)
ipipsummary$is5 <-	sapply(ipip[,ipipsummary$variable], function(X) mean(X==5)*100)

ipipsummary$meanF <- format(ipipsummary$mean,digits=2)
ipipsummary$sdF <- format(ipipsummary$sd,digits=1)
ipipsummary$is1F <- format(round(ipipsummary$is1))
ipipsummary$is2F <- format(round(ipipsummary$is2))
ipipsummary$is3F <- format(round(ipipsummary$is3))
ipipsummary$is4F <- format(round(ipipsummary$is4))
ipipsummary$is5F <- format(round(ipipsummary$is5))

ipipsummary$scaleF <- ifelse(ipipsummary$reverse == 1, 
		paste(ipipsummary$scale, "+", sep =""),
		paste(ipipsummary$scale, "-", sep =""))

i <- 1
ids <- ipip$id[i] # specify the active ID

for (i in ids) {
	id <- ids[i]
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

