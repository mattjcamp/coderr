# Coder

coderr helps you write SQL code in a way that presents a clear workflow.

Here is an example that aggregates earthquake information from the built-in
`quakes` dataset.:

    library(sqldf)
    library(Coder)

    code_sql_sample("quakes") %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean",
                      group.by.cols = c("stations")) %>%
    code_sql_select(select.cols = c("stations", "mag_mean"),
                    filters = c("stations < 15"),
                    order.by.cols = c("stations")) %>%
    sqldf()

This calculates earthquake magnitude means by station and then presents only stations with station names with a value less than 15.

`Coder` is used in large scale statistical programming projects where data is stored on remote large scale databases. There's also more to it than that - check out the code and tests to see more.
