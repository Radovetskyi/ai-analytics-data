{{ config(materialized='table') }}

WITH calendar AS (
    SELECT
        toDate('2010-01-01') + number AS date_day
    FROM numbers(365 * 50) -- 50 years of dates
)
SELECT
    date_day,
    toStartOfWeek(date_day)   AS week_start,
    toStartOfMonth(date_day)  AS month_start,
    toStartOfQuarter(date_day) AS quarter_start,
    toStartOfYear(date_day)   AS year_start
FROM calendar
WHERE date_day <= today() + 365 -- generate 1 year into future
