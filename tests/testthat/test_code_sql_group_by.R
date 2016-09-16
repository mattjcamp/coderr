library(sqldf)

context("SQL GROUP BY")

test_that("SQL Group By behaves as expected", {

  sample <- code_sql_sample("quakes")

  d <-
    sample %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean", group.by.cols = "stations") %>%
    sqldf()

  expect_equal(d[1, 2], 4.23)


})
