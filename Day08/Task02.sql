select
    *
from
    [edw].[DimReindeerStatus]
where
    [Status] = 'injured'
    and month(CAST(CAST(ValidFrom as varchar(8)) as DATE)) = 11;