select feta.ElfKey, de.ElfName, sum(dt.DurationHours) as duration
from [dbo].[FactElfTrainingAttendance] as feta
LEFT JOIN [dbo].[DimDate] as dd on feta.[DateKey] = dd.[DateKey]
LEFT JOIN [dbo].[DimTraining] as dt on feta.[TrainingKey] = dt.[TrainingKey]
LEFT JOIN [dbo].[DimElf] as de on feta.[ElfKey] = de.[ElfKey]


group by feta.ElfKey, de.ElfName
order by duration DESC, feta.ElfKey
