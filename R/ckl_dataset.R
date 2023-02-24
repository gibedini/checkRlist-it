#' Checklist dataset
#'
#'
#' A dataset containing the complete list of vascular plant names - accepted and synonyms -
#' recorded in Italy and their distribution data, alien status, conservation status and more. 
#' It includes a parsed version.
#' @docType data
#' @name ckl_names
#' @aliases ckl_data, ckl_parsed
#'
#' @source \url{https://www.dryades.units/floritaly}
#' @format
#' ckl_names is a dataframe with 26113 rows and 3 columns:
#' \describe{
#'  \item{codice_unico}{unique identifier of the plant name}
#'  \item{entita}{accepted plant name}
#'  \item{sinonimo}{synonym}
#' }
#'
#' ckl_data is a dataframe with 11080 rows and 39 columns.
#' ckl_parsed is a dataframe with parsed names from ckl_names. Parsing is done via rgnparser. 
#' During the process, low-quality (0 or 4) and unsuitable cardinality (0 or 1) records are discarded,
#' therefore the number of records in ckl_parsed is lower than that in ckl_names
#'
c("ckl_names","ckl_data","ckl_parsed")
