
#' Get Top Records
#'
#' SQL Code to get the top five records from a sample
#' @keywords database, state, location
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format or a {\link{db_table}} that has SQL which selects records
#' @values character string SQL Statement
#' @export
#' @examples
#

code_sql_head <- function(sql){

  if (!any(!c("sql_sample", "character", "db_table") %in% class(sql)))
    stop("sql_head requires sql to be one of these objects: character, sql_sample or db_table")

  if ("character" %in% class(sql))
    sql <- sprintf("SELECT TOP 5 * FROM (%s) RECORDS", sql)

  if ("sql_sample" %in% class(sql))
    sql <- sprintf("SELECT TOP 5 * FROM (%s) RECORDS", sql[1])

  if ("db_table" %in% class(sql))
    sql <- sprintf("SELECT TOP 5 * FROM %s", sql$table_name)

  sql

}
