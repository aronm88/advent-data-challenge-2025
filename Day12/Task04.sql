WITH

working_days as (SELECT distinct DateKey FROM dbo.FactProductionDailySnapshot),
workshops as (SELECT distinct WorkshopKey FROM dbo.FactProductionDailySnapshot),
toys as (SELECT distinct ToyKey FROM dbo.FactProductionDailySnapshot),

target_combinations as (
    SELECT wd.DateKey, ws.WorkshopKey, ts.ToyKey
    from working_days wd
    CROSS JOIN workshops ws
    CROSS JOIN toys ts
),

existing_combinations as (
    SELECT  distinct DateKey, WorkshopKey, ToyKey
    from dbo.FactProductionDailySnapshot
),

missing_combinations as (
    SELECT tc.*
    from target_combinations tc
    WHERE NOT EXISTS (
        SELECT 1
        from existing_combinations ec
        where ec.DateKey = tc.DateKey
        and ec.WorkshopKey = tc.WorkshopKey
        and ec.ToyKey = tc.ToyKey
    )
)

SELECT COUNT(*) from missing_combinations;

