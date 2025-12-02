with
    holidays_poland as (select * from [edw].[HolidayCountry] where Country = 'Poland'),
    holidays_japan as (select * from [edw].[HolidayCountry] where Country = 'Japan'),
    DimDateJapan as (
        SELECT  dd.*, case when hj.[DateKey] is not null then 1 else 0 end as holidays_japan
        FROM [edw].[DimDate] as dd
        LEFT JOIN holidays_japan as hj ON dd.[DateKey] = hj.[DateKey]
    ),
    DimDateJapanAndPoland as (
        SELECT  ddj.*, case when hp.[DateKey] is not null then 1 else 0 end as holidays_poland
        FROM    DimDateJapan as ddj
        LEFT JOIN holidays_poland as hp ON ddj.[DateKey] = hp.[DateKey]
    ),
    task1 as (SELECT COUNT(*) as row_count from DimDateJapanAndPoland)


SELECT * from task1;