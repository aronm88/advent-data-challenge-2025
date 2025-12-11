select feta.TrainingKey, dd.Month, dd.DayOfWeekName, SUM(dt.DurationHours)
from [dbo].[FactElfTrainingAttendance] as feta
LEFT JOIN [dbo].[DimDate] as dd on feta.[DateKey] = dd.[DateKey]
LEFT JOIN [dbo].[DimTraining] as dt on feta.[TrainingKey] = dt.[TrainingKey]
LEFT JOIN [dbo].[DimElf] as de on feta.[ElfKey] = de.[ElfKey]

WHere dd.[Month] = 12
and dd.DayOfWeekName = 'Monday'

group by grouping sets (
    (feta.TrainingKey, dd.Month, dd.DayOfWeekName),
    ()
)