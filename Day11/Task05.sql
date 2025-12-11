SELECT 
    MAX(duration) - MIN(duration) AS duration_diff
FROM (
    SELECT 
        dt.TrainingKey,
        SUM(dt.DurationHours) AS duration
    FROM dbo.FactElfTrainingAttendance AS feta
    JOIN dbo.DimTraining AS dt ON feta.TrainingKey = dt.TrainingKey
    GROUP BY dt.TrainingKey
) AS t;
