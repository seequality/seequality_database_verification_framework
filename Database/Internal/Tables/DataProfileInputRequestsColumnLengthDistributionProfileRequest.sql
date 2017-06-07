CREATE TABLE [Internal].[DataProfileInputRequestsColumnLengthDistributionProfileRequest] (
    [DataSourceID]        VARCHAR (50)  NULL,
    [ID]                  VARCHAR (255) NULL,
    [IgnoreLeadingSpace]  BIT           NULL,
    [IgnoreTrailingSpace] BIT           NULL,
	[ExecutionID] UNIQUEIDENTIFIER		NOT NULL
);

