#' Standardize scientific names
#'
#' Standardize a list of scientific names against the Checklist of the Italian flora
#' @param nvec a vector of scientific names of plants of the Italian flora
#'
#' @return a dataframe with three columns, myname, closest_match, distance
#' @export nameStand
#'
#' @examples my_names <- c("Crocus etruscus Parl.","Santolina pinnata Viv.")
#' s <- superparse(my_names)
nameStand <- function(nvec) {
  s <- superparse(nvec)
  perfect_match <- dplyr::inner_join(s,ckl_parsed,by = "verbatim", keep = TRUE) %>%
    dplyr::select(verbatim.x,verbatim.y) %>% 
    dplyr::rename(myname = verbatim.x,closest_match = verbatim.y) %>%
    dplyr::mutate(distance = stringdist::stringdist(myname,closest_match,method = "lv"))
  
  
  subopt_match <- dplyr::anti_join(s,ckl_parsed,by = "verbatim") %>%
    fuzzyjoin::stringdist_inner_join(ckl_parsed,by = c("g_epithet","s_epithet"),
                                              max_dist = 2, method = "lv",distance_col ="fuzzydist") %>%
    dplyr::select(verbatim.x,verbatim.y) %>% 
    dplyr::rename(myname = verbatim.x,closest_match = verbatim.y) %>%
    dplyr::mutate(distance = stringdist::stringdist(myname,closest_match,method = "lv")) %>%
    dplyr::group_by(myname) %>% 
    dplyr::filter(distance == min(distance))
  
  closest_match <- rbind(perfect_match,subopt_match)
  return(closest_match)
  
}