CREATE TABLE [Internal].[ExecutionLog] (
    [ExecutionID]       INT      IDENTITY (1, 1) NOT NULL,
    [ServerExecutionID] BIGINT   NULL,
    [ExecutionTime]     DATETIME NULL
);

