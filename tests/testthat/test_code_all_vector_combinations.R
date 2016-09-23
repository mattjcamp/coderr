
context("ALL VECTOR COMBINATIONS")

test_that("code_all_vector_combinations", {

  combos <- code_all_vector_combinations(c("A","B","C"))
  l <- length(combos)
  expect_equal(l, 6)

  combos <- code_all_vector_combinations(c("A","B","C"),
                                         include.these.in.each = "L")
  l <- length(combos)
  expect_equal(l, 6)

  combos <- code_all_vector_combinations(c("A","B"))
  l <- length(combos)
  expect_equal(l, 3)

  combos <- code_all_vector_combinations(c("A","B"), include.these.in.each = "L")
  l <- length(combos)
  expect_equal(l, 3)

  combos <- code_all_vector_combinations(c("A"))
  l <- length(combos)
  expect_equal(l, 1)

})
