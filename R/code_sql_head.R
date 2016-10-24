
#' Get Top Records
#'
#' SQL Code to get the top five records from a sample
#' @keywords database, state, location
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format that has SQL which selects records
#' @values character string SQL Statement
#' @export
#' @examples
#

code_sql_head <- function(sql, num_rows = 5){

  sql <- sprintf("SELECT TOP %i * FROM (%s) RECORDS", num_rows, sql[1])

  sql

}
