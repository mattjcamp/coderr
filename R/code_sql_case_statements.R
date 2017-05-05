
#' SQL Case Statements
#'
#' @description Builds case statements to use in a SELECT statement based on information in a dataframe
#' @details This makes it easier to seperate sample definitions
#' @param df dataframe with rows that will be used to create the case statements
#' @export

code_sql_case_statements <- function(df){

  df <- df %>% ungroup()

  d <-
    df %>%
    group_by(variable) %>%
    mutate(case = paste0(case, collapse = " ")) %>%
    summarise(case = max(case), order = max(order), n = n()) %>%
    ungroup() %>%
    mutate(statement = ifelse(n == 1,
                              sprintf("%s as %s", case, variable),
                              sprintf("case %s end as %s", case, variable))) %>%
    arrange(order) %>%
    select(statement)

  d$statement

}




