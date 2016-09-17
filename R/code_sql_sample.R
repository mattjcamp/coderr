
#' Sample
#'
#' SQL Code to get a sample of records
#' @keywords database, state, location
#' @param table an object of type db_table or character that indicates the table where the records are located
#' @param filter optional filter to limit the records sampled
#' @export
#' @examples
#

code_sql_sample <- function(table, filter = NULL){

  if (!any(!c("character", "db_table") %in% class(table)))
      stop("code_sql_sample requires table to be one of these objects: character or db_table")

  # GET DEFAULT SAMPLE

  if ("db_table" %in% class(table)) {
    sql <- code_sql_select(table.name = table$table_name,
                           select.cols = "*",
                           filters = filter)
  } else {
    sql <- code_sql_select(table.name = table,
                           select.cols = "*",
                           filters = filter)
  }

  class(sql) <- append(class(sql),"sql_sample")

  sql

}
