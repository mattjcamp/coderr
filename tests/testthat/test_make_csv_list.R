
context("MAKE CSV LIST")

test_that("Does make_csv_list_from_vector work?", {

  output <- make_csv_list_from_vector(c("A","B","C"))
  expect_true(output == "('A', 'B', 'C')")

})
