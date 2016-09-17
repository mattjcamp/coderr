# Coder

Coder helps you write SQL code in a way that presents a clear workflow.

Here is an example that aggregates earthquake information from the built-in
`quakes` dataset.:

    code_sql_sample("quakes") %>%
    code_sql_group_by(aggregator.cols = "avg(mag) AS mag_mean",
                      group.by.cols = c("stations")) %>%
    code_sql_select(select.cols = c("stations", "mag_mean"),
                    filters = c("stations < 15"),
                    order.by.cols = c("stations")) %>%
    sqldf()

This calculates earthquake magnitude means by station and then presents only stations with station names with a value less than 15.
