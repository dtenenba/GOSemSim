##'Semantic Similarity Between Two Gene Clusters
##'
##'Given two gene clusters, this function calculates semantic similarity between
##'them.
##'
##'
##'@param cluster1 A set of gene IDs.
##'@param cluster2 Another set of gene IDs.
##'@param ont One of "MF", "BP", and "CC" subontologies.
##'@param measure One of "Resnik", "Lin", "Rel", "Jiang" and "Wang" methods.
##'@param organism One of "anopheles", "arabidopsis", "bovine", "canine",
##'"chicken", "chimp", "coelicolor", "ecolik12", "ecsakai", "fly", "gondii","human",
##'"malaria", "mouse", "pig", "rat", "rhesus", "worm", "xenopus", "yeast" and
##'"zebrafish".
##'@param drop A set of evidence codes based on which certain annotations are
##'dropped. Use NULL to keep all GO annotations.
##'@param combine One of "max", "average", "rcmax", "BMA" methods, for combining
##'semantic similarity scores of multiple GO terms associated with protein or
##'multiple proteins assiciated with protein cluster.
##'@return similarity
##'@seealso \code{\link{goSim}} \code{\link{mgoSim}} \code{\link{geneSim}}
##'\code{\link{mgeneSim}} \code{\link{mclusterSim}}
##'@references Yu et al. (2010) GOSemSim: an R package for measuring semantic
##'similarity among GO terms and gene products \emph{Bioinformatics} (Oxford,
##'England), 26:7 976--978, April 2010. ISSN 1367-4803
##'\url{http://bioinformatics.oxfordjournals.org/cgi/content/abstract/26/7/976}
##'PMID: 20179076
##'
##'@keywords manip
##' @export
##'@examples
##'
##'	## cluster1 <- c("835", "5261","241", "994")
##'	## cluster2 <- c("307", "308", "317", "321", "506", "540", "378", "388", "396")
##'	## clusterSim(cluster1, cluster2, ont="MF", organism="human", measure="Wang")
##'
clusterSim <- function(cluster1, cluster2, ont="MF", organism="human", measure="Wang", drop="IEA", combine="BMA"){
    cgo1 <- sapply(cluster1, gene2GO, organism=organism, ont=ont, dropCodes=drop)
    cgo2 <- sapply(cluster2, gene2GO, organism=organism, ont=ont, dropCodes=drop)
    cgo1 <- unlist(cgo1)
    cgo2 <- unlist(cgo2)
    res <- mgoSim(cgo1, cgo2, ont=ont, organism=organism, measure=measure, combine=combine)
    return(res)
}
