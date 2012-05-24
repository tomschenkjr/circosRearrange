#CIRCOS REARRANGE
#REARRANGES A CROSS TABULATION OF CIP-TO-NAICS CODES
#INTO AN APPROPRIATE SEGDUP FILE FOR CIRCOS.
#LAST MODIFIED: 1/3/09 BY TOM SCHENK JR.
#DISTRIBUTED UNDER GNU-GPL 2.0, see http://creativecommons.org/licenses/GPL/2.0/

xtab <- read.csv(file.choose())
circosRearrange(xtab)
xtab <- matrix(1:12, ncol=4)
xtab <- matrix(1:8, ncol=4)

circosRearrange <- function(xtab){
	#CAREER CLUSTERS - START POINTS
	segdup.start.cc <- 0
	width <- dim(xtab)[2]-1
	height <- dim(xtab)[1]
	stop_j <- 1
		for(i in 1:height){
			if(xtab[i,1] == 0)
				1
			else
				{segdup.start.cc[stop_j] <- 1; stop_j <- stop_j + 1}

			for(j in 1:width){
					if(xtab[i,j+1] == 0)
						next
					else
						{segdup.start.cc[stop_j] <- sum(xtab[i,1:j]) + 1; stop_j <- stop_j + 1}
				}
		}
	#CAREER CLUSTERS - END POINTS
	segdup.end.cc <- 0
	width <- dim(xtab)[2]
	height <- dim(xtab)[1]
	stop_j <- 1
		for(i in 1:height){
			for(j in 1:width){
				if(xtab[i,j] == 0)
					next
				else
					{segdup.end.cc[stop_j] <- sum(xtab[i,1:j]); stop_j <- stop_j + 1}
				}
		}
	#NAIC CODES - START POINTS
	segdup.start.ic <- 0
	width <- dim(xtab)[2]
	height <- dim(xtab)[1]
	stop_j <- 1
		for(k in 1:width){
			if(xtab[1,k] == 0)
				1
			else
				{segdup.start.ic[stop_j] <- 1; stop_j <- stop_j + 1}
		}
	stop_j <- length(segdup.start.ic) + 1
		for(i in 2:height){
			for(j in 1:width){
				if(xtab[i,j] == 0)
					1
				else
					{segdup.start.ic[stop_j] <- sum(xtab[1:i-1,j]) + 1; stop_j <- stop_j + 1}
			}
		}
	#NAIC CODES - END POINTS
	segdup.end.ic <- 0
	width <- dim(xtab)[2]
	height <- dim(xtab)[1]
	stop_j <- 1
		for(i in 1:height){
			for(j in 1:width){
				if(xtab[i,j] == 0)
					1
				else
					{segdup.end.ic[stop_j] <- sum(xtab[1:i,j]); stop_j <- stop_j + 1}
			}
		}
	#CREATE CAREER CLUSTER ID'S
	career.clusters <- c("cc1", "cc2", "cc3", "cc4", "cc5", "cc6", "cc7", "cc8", "cc9", "cc10", "cc11", "cc12", "cc13", "cc14", "cc15", "cc16", "cc99")
	cc.col <- 0
	width <- dim(xtab)[2]-1
	height <- dim(xtab)[1]
	stop_j <- 1
		for(i in 1:height){
			if(xtab[i,1] == 0)
				1
			else
				{cc.col[stop_j] <- career.clusters[i]; stop_j <- stop_j + 1}

			for(j in 1:width){
					if(xtab[i,j+1] == 0)
						next
					else
						{cc.col[stop_j] <- career.clusters[i]; stop_j <- stop_j + 1}
				}
		}


	#CREATE NAICS ID'S
	twodigit.naics <- c("ic1", "ic2", "ic3")
	ic.col <- 0
	width <- dim(xtab)[2]
	height <- dim(xtab)[1]
	stop_j <- 1
		for(i in 1:height){
			for(j in 1:width){
				if(xtab[i,j] == 0)
					1
				else
					{ic.col[stop_j] <- twodigit.naics[j]; stop_j <- stop_j + 1}
			}
		}


segdup.start.cc <- matrix(segdup.start.cc, ncol=1)
segdup.end.cc <- matrix(segdup.end.cc, ncol=1)
segdup.start.ic <- matrix(segdup.start.ic, ncol=1)
segdup.end.ic <- matrix(segdup.end.ic, ncol=1)

segdup.cc <- cbind(1:dim(segdup.start.cc)[1], cc.col, segdup.start.cc, segdup.end.cc)
segdup.ic <- cbind(1:dim(segdup.start.ic)[1], ic.col, segdup.start.ic, segdup.end.ic)
segdup <- cbind(segdup.cc, segdup.ic)
write.csv(segdup)
}