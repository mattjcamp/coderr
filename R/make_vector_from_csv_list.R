
#' Make a Vector List from a CSV string
#'
#' Returns a vector
#' @param csv_list comma-seperated list in character format
#' @export
#' @examples
#'
#' make_vector_from_csv_list("A, B, C")

make_vector_from_csv_list <- function(csv_list){

  unlist(strsplit(csv_list, split = ","))

}
