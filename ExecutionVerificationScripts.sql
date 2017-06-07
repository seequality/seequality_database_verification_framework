USE SSIS_DataVerificationFreamwork;

DECLARE @LastExecution UNIQUEIDENTIFIER
DECLARE @PreviousExecution UNIQUEIDENTIFIER

;WITH cte AS 
(
	SELECT 
		ExecutionID, 
		ROW_NUMBER() OVER	(ORDER BY ExecutionTime desc) AS RN
	FROM Internal.ExecutionLog
)
SELECT 
	@LastExecution = (SELECT ExecutionID FROM cte WHERE RN = 1),
	@PreviousExecution = (SELECT ExecutionID FROM cte WHERE RN = 2)


SELECT * 
FROM internal.ColumnInput a
FULL OUTER JOIN internal.ColumnInput b 
	ON a.ID = b.ID
WHERE a.ExecutionID = @LastExecution
AND b.ExecutionID = @PreviousExecution
--AND a.ID <> b.ID

