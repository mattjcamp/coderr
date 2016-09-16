
#' Database Table
#'
#' State descriptions linked with AICODE
#' @keywords database, state, location
#' @param database the database where the table is located
#' @export
#' @examples
#
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
