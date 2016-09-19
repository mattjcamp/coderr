library(sqldf)

context("SQL SELECT")

test_that("code_sql_select writes queries correctly", {

  sql <- code_sql_select("quakes")

  expect_equal(sql, "SELECT count(*) AS N FROM quakes RECORDS")

  d <-
    code_sql_select("quakes",
                    select.cols = "stations") %>%
    sqldf()

  expect_equal(nrow(d), 1000)

  d <-
    code_sql_select("SELECT * FROM quakes WHERE stations = 41") %>%
    sqldf()

  expect_equal(d[1, 1], 12)


})

test_that("code_sql_select plays well with others", {

  sample <- code_sql_sample("quakes")

  d <-
    sample %>%
    code_sql_select(select.cols = "stations",
                    filters = "stations = 41") %>%
    code_sql_count() %>%
    sqldf()

  expect_equal(d[1, 1], 12)


})
