
#' Sample
#'
#' SQL Code to get a filtered sample of records
#' @keywords database, state, location
#' @param table indicates the table where the records are located
#' @param filter optional filter to limit the records sampled
#' @export
#' @examples
#

code_sql_sample <- function(table, filter = NULL){

  sql <- code_sql_select(table_or_sql = table,
                         select.cols = "*",
                         filters = filter)

  sql

}
