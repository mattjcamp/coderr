
#' Select List Shortcut
#'
#' @description Makes a select list
#' @details Makes a list based on the columns in a dataset that can be used
#' in a SELECT statement
#' @param dataset
#' @export
#' @examples
#

code_make_select_list <- function(dataset) {
  columns <-
    dataset %>%
    names() %>%
    coderr::code_vector_to_csv_list(add.quotes = FALSE) %>%
    str_replace_all("\"", "'")
  columns <- str_sub(columns, 2, str_length(columns))
  columns <- str_sub(columns, 0, str_length(columns) - 1)
  columns
}
