
context("MAKE ALL GROUP BY COMBOS")

test_that("Does make_all_group_by_combos work?", {

  combos <- make_all_group_by_combos(c("A","B","C"))
  l <- nrow(combos)
  expect_equal(l, 6)

})
