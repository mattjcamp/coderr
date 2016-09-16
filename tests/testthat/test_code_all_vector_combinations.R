
context("Unique Group Combinations")

test_that("code_all_vector_combinations", {

  l <- length(code_all_vector_combinations(c("A","B","C")))
  expect_equal(l, 6)

})
