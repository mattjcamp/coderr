
#' Count Records
#'
#' @description SQL Code to get a distinct column values
#' @details Counts the rows from a SELECT statement or table
#' @keywords database, state, location
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format that has SQL which selects records
#' @param by count by these groups
#' @export
#' @examples
#

code_sql_count <- function(sql, by = NULL){

  sql <- sql[1]

  if (is.null(by)) {
    sql <- sprintf("SELECT count(*) as n FROM (%s) RECORDS", sql)
  } else {
    by <- code_vector_to_csv_list(by, FALSE, FALSE)
    sql <- sprintf("SELECT %s, count(*) as n FROM (%s) RECORDS GROUP BY %s", by, sql, by)
  }

  sql

}
