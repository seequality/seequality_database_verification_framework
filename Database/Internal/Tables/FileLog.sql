CREATE TABLE [Internal].[FileLog] (
    [FilePath]      VARCHAR (255)    NULL,
    [ParseFailed]   BIT              NULL,
    [ExecutionTIme] DATETIME         NULL,
    [ExecutionID]   UNIQUEIDENTIFIER NULL
);

