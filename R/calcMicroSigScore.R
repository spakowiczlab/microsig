#' Function to calculate microbe signature scores given a set of up and down
#' regulated microbes and the relative abundances of microbe per sample
#'
#' @param taxa a data frame where columns are microbes and rows are samples, first
#'    column named 'sample'
#' @param sig.up a character vector listing microbes in given signature that are
#'    up-regulated, empty if none
#' @param sig.down a character vector listing microbes in given signature that are
#'    down-regulated, empty if none
#'
#' @return a data frame with samples and corresponding microbe signature scores
#'
#' @import dplyr
#' @import tidyr
#'
#' @export
calcMicroSigScore <- function(taxa, sig.up, sig.down){
  df <- taxa %>%
    tidyr::gather(microbe, exo.ra, -sample) %>%
    dplyr::group_by(sample) %>%
    dplyr::mutate(z_score = scale(exo.ra))

  upMics <- df %>%
    dplyr::filter(microbe %in% sig.up)

  upTotal <- length(unique(upMics$microbe))

  upMics <- upMics %>%
    dplyr::group_by(sample) %>%
    dplyr::summarize(tempUp = sum(exo.ra))

  downMics <- df %>%
    dplyr::filter(microbe %in% sig.down)

  downTotal <- length(unique(downMics$microbe))

  downMics <- downMics %>%
    dplyr::group_by(sample) %>%
    dplyr::summarize(tempDown = sum(exo.ra))

  if(upTotal == 0 && downTotal == 0){
    df <- data.frame(matrix(ncol = 0, nrow = 0))
  }else if(upTotal == 0){
    df <- downMics %>%
      dplyr::mutate(score = tempDown*(1/downTotal)) %>%
      dplyr::select(sample,score)
  }else if(downTotal == 0){
    df <- upMics %>%
      dplyr::mutate(score = tempUp*(1/upTotal)) %>%
      dplyr::select(sample, score)
  }else{
    df <- merge(upMics, downMics, by = "sample") %>%
      dplyr::mutate(score = (tempUp - tempDown)*(1/(upTotal + downTotal))) %>%
      dplyr::select(sample, score)
  }

  return(df)
}
