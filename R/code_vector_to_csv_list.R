#' Adapt Vector to CSV List
#'
#' Returns a comma-seperated list in a string
#' @param vector a vector list
#' @param add.quotes put quotes around each item in the list
#' @param enclose.in.parenthesis enclose the entire csv list in parenthesis
#' @keywords coder, sql
#' @export
#' @examples
#'
#' code_vector_to_csv_list(c("A","B","C"))
#'
#' ('A', 'B', 'C')
#'

code_vector_to_csv_list <- function(vector,
                                    add.quotes = TRUE,
                                    enclose.in.parenthesis = TRUE){

  if (add.quotes)
    s <- sprintf("'%s'", vector)
  else
    s <- sprintf("%s", vector)
  s <- paste(s, collapse = ", ")
  if (enclose.in.parenthesis)
    s <- sprintf("(%s)", s)

    s
}
