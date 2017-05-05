
#' SQL Group by list
#'
#' @description Turns a vector into a list of group by statements that capture every combination of items in the vectory
#' @param group_by_cols The columns that will be included in the group by statements
#' @export

code_group_by_list <- function(group_by_cols) {

  # PROCEDURE

  g_by_list <- code_all_vector_combinations(group_by_cols)
  g_by_list_length <- length(g_by_list)
  ds_group_by_list <- NULL

  for (i in 1:g_by_list_length) {

    # GET GROUP BY STATEMENT

    g_by_statement <- code_vector_to_csv_list(vector = g_by_list[[i]],
                                              add.quotes = FALSE,
                                              enclose.in.parenthesis = FALSE)

    # SELECT STATEMENT

    cols_to_add  <- group_by_cols[!group_by_cols %in% g_by_list[[i]]]
    all_cols_order <- c(g_by_list[[i]], cols_to_add)
    all_cols_order <- order(all_cols_order)
    cols_to_add <- sprintf("'All' as %s", cols_to_add)
    all_cols <- c(g_by_list[[i]], cols_to_add)
    all_cols <- all_cols[all_cols_order]
    all_cols <- code_vector_to_csv_list(all_cols,
                                        add.quotes = FALSE,
                                        enclose.in.parenthesis = FALSE)
    s_statement <- all_cols

    # PACKAGE STATEMENTS

    ds_group_by_list <- rbind(ds_group_by_list,
                              data.frame(list(id = i,
                                              select = s_statement,
                                              group_by = g_by_statement)))

  }

  ds_group_by_list

}
