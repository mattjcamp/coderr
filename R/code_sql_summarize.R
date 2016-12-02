
#' Summarize Records
#'
#' @description SQL Code to get descriptive statistics
#' @details Summarizes the numeric columns from a SELECT statement or table
#' @keywords stats
#' @param sql an object of type {\link{code_sql_sample}}, character in SQL format that has SQL which selects records
#' @param cols the columns that you want to analyze
#' @param by summarize by these groups
#' @param include_sdp include the standard deviation (population). This is optional because some databases (SQLite in particular) do not support this statistic.
#' @export
#' @examples
#

code_sql_summarize <- function(sql, cols, by = NULL,
                               include_sdp = FALSE){

  sql <- sql[1]

  s <- "count(COL) as n_COL, avg(COL) as mean_COL%s, min(COL) as min_COL, max(COL) as max_COL"

  if (include_sdp) {
    s <- sprintf(s, ", stdevp(COL) as sdp_COL")
  } else {
    s <- sprintf(s, "")
  }

  s <- stringr::str_replace_all(s, "COL", cols)
  s <- coderr::code_vector_to_csv_list(s, FALSE, FALSE)

  if (is.null(by)) {
    sql <- sprintf("SELECT %s FROM (%s) RECORDS", s, sql)
  } else {
    by <-  coderr::code_vector_to_csv_list(by, FALSE, FALSE)
    sql <- sprintf("SELECT %s, %s FROM (%s) RECORDS GROUP BY %s", by, s, sql, by)
  }

  sql

}
