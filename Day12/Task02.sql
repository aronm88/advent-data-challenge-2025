SELECT
    WorkshopKey,
    ToyKey,
    DateKey
FROM dbo.FactProductionDailySnapshot
GROUP BY
    WorkshopKey,
    ToyKey,
    DateKey
HAVING COUNT(*) > 1;
