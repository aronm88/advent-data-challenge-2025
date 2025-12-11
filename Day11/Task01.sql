select dd.DayOfWeekName, COUNT(distinct de.ElfKey) 
from [dbo].[FactElfTrainingAttendance] as feta
LEFT JOIN [dbo].[DimDate] as dd on feta.[DateKey] = dd.[DateKey]
LEFT JOIN [dbo].[DimTraining] as dt on feta.[TrainingKey] = dt.[TrainingKey]
LEFT JOIN [dbo].[DimElf] as de on feta.[ElfKey] = de.[ElfKey]
where de.ElfName is not null
group by dd.DayOfWeekName

-- SELECT count(*) from [dbo].[FactElfTrainingAttendance] as feta 