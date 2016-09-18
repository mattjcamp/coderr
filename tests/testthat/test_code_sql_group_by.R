library(sqldf)

context("SQL GROUP BY")

test_that("SQL Group By behaves as expected", {

  q <- quakes
  q$cat1 <- round(runif(n = 1000, min = 1, max = 10), 0)
  q$cat2 <- round(runif(n = 1000, min = 1, max = 10), 0)
  q$cat3 <- round(runif(n = 1000, min = 1, max = 10), 0)
  sample <- code_sql_sample("q")

  d <-
    sample %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean", group.by.cols = "stations") %>%
    sqldf()

  expect_equal(d[1, 2], 4.23)

  d <-
    sample %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean",
                      group.by.cols = c("stations", "cat1", "cat2", "cat3"),
                      include.all.possible.combos = TRUE) %>%
  sqldf()

  expect_true(nrow(d) > 0)

  d <-
    sample %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean",
                      group.by.cols = c("stations", "cat1", "cat2", "cat3"),
                      include.all.possible.combos = TRUE) %>%
    code_sql_select(select.cols = c("stations", "cat1", "cat2", "cat3", "mag_mean"),
                    filters = c("stations < 15"),
                    order.by.cols = c("stations", "cat1", "cat2", "cat3")) %>%
  sqldf()

  expect_true(nrow(d) > 0)



})
