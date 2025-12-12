with base as (
    SELECT
        WorkshopKey,
        ToyKey,
        IsReindeerPowered,
        ProducedQty,
        DateKey,
        BacklogQty,
        LAG(BacklogQty) OVER (
            PARTITION BY WorkshopKey,
            ToyKey
            order by
                DateKey
        ) AS PreviousDayBacklogQty
    FROM
        dbo.FactProductionDailySnapshot
    WHERE
        IsReindeerPowered = 1
        AND ProducedQty > 150
),
condition_met as (
    SELECT
        *
    FROM
        base
    WHERE
        BacklogQty > PreviousDayBacklogQty
)
SELECT
    COUNT(distinct DateKey)
FROM
    condition_met;