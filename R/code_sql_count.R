
#' Count Records
#'
#' SQL Code to get a distinct column values
#' @keywords database, state, location
#' @param sql an object of type sql_sample, character in SQL format or a db_table that has code which selects a sample of records
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
