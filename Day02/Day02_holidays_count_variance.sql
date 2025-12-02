-- DateInt is stored as an integer, the decimal part is discarded, leaving only the year.
with holidays_comparison as (
    SELECT
        (select COUNT(Country) from [edw].HolidayCountry where Country = 'Japan' and DateKey / 10000 = 2024) as Holidays_Japan_2024,
        (select COUNT(Country) from [edw].HolidayCountry where Country = 'Poland' and DateKey / 10000 = 2026) as Holidays_Poland_2026
)

SELECT
    Holidays_Japan_2024,
    Holidays_Poland_2026,
    Holidays_Japan_2024 - Holidays_Poland_2026 as Holiday_Count_Variance
FROM holidays_comparison;