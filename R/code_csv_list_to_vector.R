
#' Adapt CSV List to Vector
#'
#' Returns a vector
#' @param csv_list comma-seperated list in character format
#' @keywords coder, sql
#' @export
#' @examples
#'

code_csv_list_to_vector <- function(csv_list){

  num_words <- str_count(csv_list, ",")
  v <- NULL
  for (i in 1:num_words)
    v <- c(v, str_trim(word(string = csv_list, start = i, end = i, sep = ",")))

  v

}
