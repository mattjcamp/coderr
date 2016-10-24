
#' Distinct Records
#'
#' SQL Code to get a distinct column values
#' @keywords database, state, location
#' @param sql SQL which selects records
#' @param col the columns that you want to look at
#' @export
#' @examples
#

code_sql_distinct <- function(sql, col){

  col <- code_vector_to_csv_list(col,
                                 add.quotes = FALSE,
                                 enclose.in.parenthesis = FALSE)
  col <- sprintf("DISTINCT %s", col)
  sql <- sql[1]

  if ("character" %in% class(sql))
    sql <- sprintf("SELECT %s FROM (%s) RECORDS", col, sql)

  sql

}
