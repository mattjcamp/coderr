
context("MAKE VECTOR FROM CSV LIST")

test_that("Does make_vector_from_csv_list work?", {

  output <- make_vector_from_csv_list("A, B, C")
  expect_true(length(output) == 3)

})
