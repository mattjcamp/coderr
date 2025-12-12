#' Adapt Vector to CSV List
#'
#' Returns a comma-seperated list in a string
#' @param vector a vector list
#' @param add_quotes put quotes around each item in the list
#' @param enclose_in_parenthesis enclose the entire csv list in parenthesis
#' @keywords coder, sql
#' @export
#' @examples
#'
#' make_csv_list_from_vector(c("A","B","C"))
#'

make_csv_list_from_vector <- function(
  vector
  , add_quotes = TRUE
  , enclose_in_parenthesis = TRUE
){

  if (add_quotes)
    s <- sprintf("'%s'", vector)
  else
    s <- sprintf("%s", vector)
  s <- paste(s, collapse = ", ")
  if (enclose_in_parenthesis)
    s <- sprintf("(%s)", s)

  s
}
