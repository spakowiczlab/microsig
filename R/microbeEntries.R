#' Microbe Entries
#' A function that can be used to call of specific microbe signatures.
#' @param query Name of the signature group. If query is passed "all" function will return all the signature groups
#'
#' @return The microbes within a desired signature group in the format "x__microbe name" with x indicating taxonomic level
#' @export
#'
#' @examples microbeEntries("paa_up")
microbeEntries <- function(query){

  paa_up <- c("s__Clostridium sp. UNK-MGS-6", "s__Firmicutes bacterium CAG 41",
              "s__Coprobacillus cateniformis", "s__Clostridia bacterium UC5-1-2G4",
              "s__Streptococcus dysgalactiae", "s__Acidaminococcus sp. HPA0509",
              "s__Roseburia sp.CAG-303", "s__Butyrivibrio_sp. AE2032",
              "s__Coprobacillus sp. 29-1", "s__Coprobacillus sp. D6")
  paa_down <- c("s__Alistipes sp. CAG-435", "s__Fusobacterium hwasookii",
                "s__Leuconostoc sp. DORA-2", "s__Paenibacillus lentimorbus",
                "s__Fusobacterium sp. oral taxon 370", "s__Alcanivorax hongdengensis",
                "s__Arthrobacter sp. LS16", "s__Bacillus sp. 5B6", "s__Bacillus velezensis",
                "s__Fusobacterium sp. OBRC1")

  mic_list <- list(paa_up, paa_down)

  names(mic_list) <- c("paa_up", "paa_down")

  if(query == "all"){
    return(mic_list)
  }

  mics_queried <- mic_list[[query]]
  return(mics_queried)
}
