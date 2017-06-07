CREATE PROCEDURE [Internal].[LogStartExecution]
	@ExecutionID UNIQUEIDENTIFIER,
	@ExecutionTime DATETIME,
	@ServerExecutionID BIGINT = NULL
AS
BEGIN
	INSERT INTO Internal.ExecutionLog (ExecutionID, ExecutionTime, ServerExecutionID) VALUES (@ExecutionID, @ExecutionTime, @ServerExecutionID);
END

