
context("Unique Group Combinations")

test_that("code_all_vector_combinations", {

  # l <- length(code_all_vector_combinations(c("A")))
  # expect_equal(l, 1)
  # l <- length(code_all_vector_combinations(c("A","B")))
  # expect_equal(l, 3)
  l <- length(code_all_vector_combinations(c("A","B","C")))
  expect_equal(l, 6)



})

# combos <- code_all_vector_combinations(c("A"))
# combos <- code_all_vector_combinations(c("A","B","C"))
# length(combos)
# combos
