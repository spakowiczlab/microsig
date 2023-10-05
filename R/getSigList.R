#' Given a single cell value from BugSigDB output in the column 'MetaPhlAn.taxon.names',
#' returns a list of the microbes
#'
#' @param sig character string from BugSigDB output containing comma separated
#' Metaphlan taxonomic names
#'
#' @return sig.list , a character list of containing the string after the last
#' "|" in each comma separated Metaphlan taxonomic name
#'
#' @export
getSigList <- function(sig){
  sig.list <- sub("^.+\\|", "", unlist(strsplit(sig ,",")))
  return(sig.list)
}
