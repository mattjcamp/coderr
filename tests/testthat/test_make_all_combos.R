
context("ALL VECTOR COMBINATIONS")

test_that("make_all_combos", {

  combos <- make_all_combos(c("A","B","C"))
  l <- length(combos)
  expect_equal(l, 6)

  combos <- make_all_combos(
    c("A","B","C")
    , include_these_in_each = "L"
  )
  l <- length(combos)
  expect_equal(l, 6)

  combos <- make_all_combos(c("A","B"))
  l <- length(combos)
  expect_equal(l, 3)

  combos <- make_all_combos(
    c("A","B")
    , include_these_in_each = "L"
  )
  l <- length(combos)
  expect_equal(l, 3)

  combos <- make_all_combos(c("A"))
  l <- length(combos)
  expect_equal(l, 1)

})
