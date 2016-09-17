
#' Database Table Definition
#'
#' @description Everything you need to know about a database table.
#' @details This version of db_table is generic and meant as a template. Code custom versions of this object for tables that you need to reference often. Can be used as input for a sample_sql object.
#' @keywords database, state, location
#' @param table_name the name of the table (without the database or schema prefix)
#' @param database the database where the table is located
#' @export
#' @examples

db_table <- function(table_name, database = "") {

  me <- list()

  me$cols <- c('*')
  me$database <- database
  if (database != "")
    me$table_name <- sprintf("%s.%s", database, table_name)
  else
    me$table_name <- sprintf("%s", table_name)

  class(me) <- append(class(me),"db_table")

  me

}
