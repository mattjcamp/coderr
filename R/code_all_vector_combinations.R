
#' All Combinations of a List
#'
#' Returns all possible combinations of a list optionally appending some elements to make sure they are included in each list item
#' @param vector the list of items
#' @param include.these.in.each items that you want to make sure are included in each returned itme
#' @keywords code automation
#' @export
#' @examples

code_all_vector_combinations <- function(vector, include.these.in.each = NULL){

  num.cat <- length(vector) - 1
  c.all <- NULL
  for (i in 1:num.cat) {
    cats <- combn(vector, i, simplify = FALSE)
    c.all <- c(c.all, cats)
  }

  num.c.all <- length(c.all)

  for (i in 1:num.c.all) {
    o <- order(c.all[[i]])
    o <- unique(o)
    c.all[[i]] <- c.all[[i]][o]
  }

 for (i in 1:num.c.all) {
    gb <- c(include.these.in.each, c.all[[i]])
    o <- order(gb)
    c.all[[i]] <- unique(gb[o])
  }

  r <- unique(c.all)

  if (length(vector) == 2)
    r <- c(r, list(c(vector[1], vector[2], include.these.in.each)))

  if (length(vector) == 1)
    r <- r[1]

  r

}
