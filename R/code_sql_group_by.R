
#' Aggregate Grouped Records
#'
#' SQL Code to get aggregated statistics for groups
#' @keywords database, state, location
#' @param sql an object of type sql_sample, character in SQL format or a db_table that has code which selects a sample of records
#' @param aggregator.cols the aggregation rules to apply for each measure (ie: count(*) AS N)
#' @param group.by.cols the columns that you wish to group by
#' @export
#' @examples
#

code_sql_group_by <- function(sql, aggregator.cols, group.by.cols){

  if (!any(!c("sql_sample", "character", "db_table") %in% class(sql)))
      stop("code_sql_group_by requires sql to be one of these objects: character, sql_sample or db_table")

  if ("db_table" %in% class(sql))
    sql <- sprintf("SELECT * FROM %s", sql$table_name)
  else
    sql <- sql[1]

  aggregator.cols <- code_vector_to_csv_list(vector = aggregator.cols,
                                             add.quotes = FALSE,
                                             enclose.in.parenthesis = FALSE)

  group.by.cols <- code_vector_to_csv_list(vector = group.by.cols,
                                           add.quotes = FALSE,
                                           enclose.in.parenthesis = FALSE)

  sql <- sprintf("SELECT %s, %s FROM (%s) RECORDS GROUP BY %s",
                 group.by.cols, aggregator.cols,
                 sql, group.by.cols)

  sql

}
