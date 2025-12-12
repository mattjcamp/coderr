
#' Make Group by List for All Combinations of a List of Items
#'
#' @description Turns a character list into a list of group by statements 
#' that captures every combination of items in the vector
#' @param group_by_cols The columns that will be included in the group 
#' by statements
#' @export

make_all_group_by_combos <- function(group_by_cols) {

  g_by_list <- make_all_combos(group_by_cols)
  g_by_list_length <- length(g_by_list)
  ds_group_by_list <- NULL

  for (i in 1:g_by_list_length) {

    # GET GROUP BY STATEMENT

    g_by_statement <- make_csv_list_from_vector(
      vector = g_by_list[[i]]
      , add_quotes = FALSE
      , enclose_in_parenthesis = FALSE)

    # SELECT STATEMENT

    cols_to_add  <- group_by_cols[!group_by_cols %in% g_by_list[[i]]]
    all_cols_order <- c(g_by_list[[i]], cols_to_add)
    all_cols_order <- order(all_cols_order)
    cols_to_add <- sprintf("'all' as %s", cols_to_add)
    all_cols <- c(g_by_list[[i]], cols_to_add)
    all_cols <- all_cols[all_cols_order]
    all_cols <- make_csv_list_from_vector(
      all_cols
      , add_quotes = FALSE
      , enclose_in_parenthesis = FALSE
    )
    s_statement <- all_cols

    # PACKAGE STATEMENTS

    ds_group_by_list <- rbind(ds_group_by_list,
                              data.frame(list(
                                  id = i
                                  , select = s_statement
                                  , group_by = g_by_statement
                                  )
                                )
                              )

  }

  ds_group_by_list

}
