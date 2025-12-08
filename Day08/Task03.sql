with base as (
    SELECT
        [ReindeerID],
        [Position],
        [Status],
        CAST(FORMAT(ChangeDate, 'yyyyMMdd') AS INT) AS [ValidFrom] -- MM stands for month, mm stand for minutes
    FROM
        [ReindeerMaster].[ReindeerChanges]
),
base_with_valid_to as (
    SELECT
        *,
        (
            LEAD(ValidFrom) over (
                PARTITION BY ReindeerID
                order by
                    ValidFrom
            )
        ) - 1 as ValidTo
    FROM
        base
),
final as (
    SELECT
        ReindeerID,
        [Position],
        [Status],
        ValidFrom,
        case
            when ValidTo is NULL then 21991231
            else ValidTo
        end as ValidTo,
        case
            when ValidTo is NULL then 1
            else 0
        end as [IsCurrent]
    From
        base_with_valid_to
)
SELECT
    *
from
    final