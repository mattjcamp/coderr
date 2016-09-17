library(sqldf)
library(Coder)

context("SQL GROUP BY")

test_that("SQL Group By behaves as expected", {

  q <- quakes
  q$cat1 <- round(runif(n = 1000, min = 1, max = 5), 0)
  q$cat2 <- round(runif(n = 1000, min = 6, max = 10), 0)
  q$cat3 <- round(runif(n = 1000, min = 2, max = 4), 0)

  sample <- code_sql_sample("q")

  d <-
    sample %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean", group.by.cols = "stations") %>%
    sqldf()

  expect_equal(d[1, 2], 4.23)

    d <-
    sample %>%
    code_sql_kitchen_sink(aggregator.cols.with.stat.def = "avg(mag) AS mag_mean",
                          aggregator.cols = "mag_mean",
                          group.by.cols = c("stations", "cat1", "cat2", "cat3")) %>%
    sqldf()

    d <-
      sample %>%
      code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean",
                        group.by.cols = c("stations", "cat1", "cat2", "cat3"),
                        include.all.possible.combos = TRUE) %>%
    sqldf()


})
