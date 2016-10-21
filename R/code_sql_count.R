
#' Count Records
#'
#' @description SQL Code to get a distinct column values
#' @details Counts the rows from a SELECT statement or table
#' @keywords database, state, location
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format or a {\link{db_table}} that has SQL which selects records
#' @param by count by these groups
#' @export
#' @examples
#

code_sql_count <- function(sql, by = NULL){

  if (!any(!c("sql_sample", "character", "db_table") %in% class(sql)))
      stop("code_sql_count requires sql to be one of these objects: character, sql_sample or db_table")

  if ("character" %in% class(sql))
    sql <- sql

  if ("sql_sample" %in% class(sql))
    sql <- sql[1]

  if ("db_table" %in% class(sql))
    sql <- sql$table_name

  if (is.null(by)) {
    sql <- sprintf("SELECT count(*) FROM (%s) RECORDS", sql)
  } else {
    by <- code_vector_to_csv_list(by, FALSE, FALSE)
    sql <- sprintf("SELECT count(*) FROM (%s) RECORDS GROUP BY %s", sql, by)
  }

  sql

}
