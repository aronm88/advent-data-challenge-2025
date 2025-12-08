select [Status]
from [edw].[DimReindeerStatus]
where [ReindeerID] = 5
and 20251208 between ValidFrom and ValidTo;