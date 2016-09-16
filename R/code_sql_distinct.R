
#' Distinct Records
#'
#' SQL Code to get a distinct column values
#' @keywords database, state, location
#' @param db_table an object of type db_table which includes the table where the records are located
#' @param col the columns that you want to look at
#' @export
#' @examples
#

code_sql_distinct <- function(sql, col){

  if (!any(!c("sql_sample", "character", "db_table") %in% class(sample)))
    stop("code_sql_distinct requires sample to be one of these objects: character, sql_sample or db_table")

  # PUT SELECT COLUMNS TOGETHER

  col <- code_vector_to_csv_list(col,
                                 add.quotes = FALSE,
                                 enclose.in.parenthesis = FALSE)
  col <- sprintf("DISTINCT %s", col)

  if ("character" %in% class(sql))
    sql <- sprintf("SELECT %s FROM (%s) RECORDS", col, sql)

  if ("db_table" %in% class(sql))
    sql <- code_sql_query(table.name = sql$table_name,
                          select.cols = col)

  if ("sql_sample" %in% class(sql))
    sql <- sprintf("SELECT %s FROM (%s) RECORDS", col, sql[1])

  sql

}
