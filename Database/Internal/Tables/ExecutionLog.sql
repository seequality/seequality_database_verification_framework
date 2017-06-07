CREATE TABLE [Internal].[ExecutionLog]
(
	[ExecutionID] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [ExecutionTime] DATETIME NOT NULL, 
    [ServerExecutionID] BIGINT NULL
)
