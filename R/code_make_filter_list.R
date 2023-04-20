
#' Filter List Shortcut
#'
#' @description Makes a filter list
#' @details Makes a list based on the columns in a dataset that can be used
#' in a WHERE statement
#' @param dataset
#' @export
#' @examples
#

code_make_filter_list <- function(dataset) {
  library(tidyverse)
  library(magrittr)
  columns <-
    dataset %>%
    select(1) %>%
    distinct() %>%
    as.character() %>%
    coderr::code_vector_to_csv_list() %>%
    str_replace_all("\"", "'")
  if (dataset %>% count() > 1) {
    columns <- str_sub(columns, 5, str_length(columns))
    columns <- str_sub(columns, 0, str_length(columns) - 3)
  } else {
    columns <- str_sub(columns, 2, str_length(columns))
    columns <- str_sub(columns, 0, str_length(columns) - 1)
  }
  columns
}
