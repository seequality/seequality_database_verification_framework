
CREATE PROCEDURE [Internal].[LogStartExecution]
	@ServerExecutionID BIGINT = NULL
AS
BEGIN
	INSERT INTO Internal.ExecutionLog 
	(ExecutionTime, ServerExecutionID)
	OUTPUT INSERTED.ExecutionID
	VALUES (GETDATE(), @ServerExecutionID);
END

