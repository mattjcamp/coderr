
#' Adapt CSV List to Vector
#'
#' Returns a vector
#' @param csv_list comma-seperated list in character format
#' @keywords coder, sql
#' @export
#' @examples
#'

code_csv_list_to_vector <- function(csv_list){

  unlist(strsplit(csv_list, split=","))

}
