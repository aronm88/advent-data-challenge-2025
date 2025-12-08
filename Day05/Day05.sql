with
DimWishChannel as (select * from dbo.DimWishChannel),
FactWish as (select * from dbo.FactWish),
FactWishGroupedByStatus as (SELECT WishStatus, COUNT(*) as WishStatusCount from FactWish group by WishStatus),
FactWishGroupedByChild as (SELECT ChildKey, COUNT(*) as ChildWishCount from FactWish group by ChildKey)

-- task 01
-- SELECT WishStatusCount from FactWishGroupedByStatus where WishStatus='rejected'

-- task 02
-- SELECT top(1) fwgc.*, dc.ChildName from FactWishGroupedByChild as fwgc
-- LEFT join dbo.DimChild as dc on  fwgc.ChildKey = dc.ChildKey
-- ORDER BY ChildWishCount ASC;

-- task 03
-- SELECT 
--     100.0 * SUM(CASE WHEN WishStatus = 'new' THEN 1 ELSE 0 END)
--     / NULLIF(COUNT(*), 0) AS NewWishRatio
-- FROM FactWish;

--task 04
-- SELECT top(1) dr.Country, dwc.WishChannelName, COUNT(*) as WishCount
-- from dbo.FactWish fw
-- LEFT JOIN DimChild dc on fw.ChildKey = dc.ChildKey
-- LEFT JOIN DimRegion dr on dc.RegionKey = dr.RegionKey
-- LEFT JOIN DimWishChannel dwc on fw.WishChannelKey = dwc.WishChannelKey
-- where dr.Country = 'Poland'
-- GROUP BY dr.Country, dwc.WishChannelName 
-- order by WishCount DESC;

-- task 05
SELECT TOP(1)
    wd.ChildKey,
    dd.[Date],
    LEAD(dd.[Date]) OVER (
        partition by wd.ChildKey
        ORDER BY dd.[Date]
    ) AS NextWishDate,
    DATEDIFF(DAY, dd.[Date], LEAD(dd.[Date]) OVER (
        partition by wd.ChildKey 
        ORDER BY dd.[Date]
    )) AS DaysUntilNextWish
from dbo.FactWish wd
LEFT JOIN DimDate dd on wd.WishDateKey = dd.DateKey
order by DaysUntilNextWish DESC;