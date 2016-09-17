
#' Count Records
#'
#' @description SQL Code to get a distinct column values
#' @details Counts the rows from a SELECT statement or table
#' @keywords database, state, location
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format or a {\link{db_table}} that has SQL which selects records
#' @export
#' @examples
#

code_sql_count <- function(sql){

  if (!any(!c("sql_sample", "character", "db_table") %in% class(sql)))
      stop("code_sql_count requires sql to be one of these objects: character, sql_sample or db_table")

  if ("character" %in% class(sql))
    sql <- sprintf("SELECT count(*) FROM (%s) RECORDS", sql)

  if ("sql_sample" %in% class(sql))
    sql <- sprintf("SELECT count(*) FROM (%s) RECORDS", sql[1])

  if ("db_table" %in% class(sql))
    sql <- sprintf("SELECT count(*) FROM %s", sql$table_name)

  sql

}
