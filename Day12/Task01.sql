with base as (
    SELECT
        WorkshopKey,
        ToyKey,
        [IsReindeerPowered],
        DateKey,
        ProducedQty,
        BacklogQty,
        LAG(BacklogQty) OVER (
            PARTITION BY WorkshopKey,ToyKey,[IsReindeerPowered]
            ORDER BY DateKey
        ) AS PreviousDayBacklogQty
    FROM
        [dbo].[FactProductionDailySnapshot] AS fpds
),
base_with_diff as (
    SELECT
        *,
        BacklogQty - PreviousDayBacklogQty AS BacklogQtyDiff
    from
        base
)
SELECT
    COUNT(*) AS ZeroProducedQty_IncreasedBacklogQty_Count
FROM
    base_with_diff
WHERE
    ProducedQty = 0
    AND BacklogQtyDiff > 0;