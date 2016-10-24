
#' Aggregate Grouped Records
#'
#' SQL Code to get aggregated statistics for groups
#' @keywords database, state, location
#' @param sql SQL which selects records
#' @param aggregator.cols the aggregation rules to apply for each measure (ie: count(*) AS N)
#' @param group.by.cols the columns that you wish to group by
#' @param include.all.possible.combos when TRUE does group by statements for every possible combo and then uses UNION to put them all together.
#' @export
#' @examples
#

code_sql_group_by <- function(sql,
                              aggregator.cols,
                              group.by.cols,
                              include.all.possible.combos = FALSE){

  sql <- sql[1]

  if (!include.all.possible.combos) {

    aggregator.cols <- code_vector_to_csv_list(vector = aggregator.cols,
                                               add.quotes = FALSE,
                                               enclose.in.parenthesis = FALSE)

    group.by.cols <- code_vector_to_csv_list(vector = group.by.cols,
                                             add.quotes = FALSE,
                                             enclose.in.parenthesis = FALSE)

    sql <- sprintf("SELECT %s, %s FROM (%s) RECORDS GROUP BY %s",
                   group.by.cols, aggregator.cols,
                   sql, group.by.cols)

  } else {

    aggregator.cols.with.stat.def <- aggregator.cols
    aggregator.cols.with.stat.def <- code_vector_to_csv_list(vector = aggregator.cols.with.stat.def,
                                                             add.quotes = FALSE,
                                                             enclose.in.parenthesis = FALSE)

    s <- stringr::str_locate(aggregator.cols, "AS")[,1]
    l <- stringr::str_length(aggregator.cols)
    s <- s + 2
    aggregator.cols <- stringr::str_trim(stringr::str_sub(aggregator.cols, s, l))

    cols <- code_all_vector_combinations(group.by.cols)
    cols.length <- length(cols)
    group.by.sql.list <- NULL

    for (i in 1:cols.length) {

      group.by.cols.string <- code_vector_to_csv_list(vector = cols[[i]],
                                                      add.quotes = FALSE,
                                                      enclose.in.parenthesis = FALSE)
      group.sql <- sprintf("SELECT %s, %s FROM (%s) RECORDS GROUP BY %s",
                           group.by.cols.string, aggregator.cols.with.stat.def,
                           sql, group.by.cols.string)

      cols.to.add  <- group.by.cols[!group.by.cols %in% cols[[i]]]
      all.cols.order <- c(cols[[i]], cols.to.add)
      all.cols.order <- order(all.cols.order)
      cols.to.add <- sprintf("'All' AS %s", cols.to.add)
      all.cols <- c(cols[[i]], cols.to.add)
      all.cols <- all.cols[all.cols.order]
      all.cols <- c(all.cols, aggregator.cols)
      all.cols <- code_vector_to_csv_list(all.cols,
                                          add.quotes = FALSE,
                                          enclose.in.parenthesis = FALSE)
      group.sql <- sprintf("SELECT %s FROM (%s) RECORDS", all.cols, group.sql)

      group.by.sql.list <- c(group.by.sql.list, group.sql)

    }

    l <- length(group.by.sql.list)
    sql <- group.by.sql.list[1]
    for (i in 2:l)
      sql <- sprintf("%s UNION %s", sql, group.by.sql.list[i])

  }

  sql

}
