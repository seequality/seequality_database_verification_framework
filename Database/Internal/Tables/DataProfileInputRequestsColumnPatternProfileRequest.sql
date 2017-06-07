CREATE TABLE [Internal].[DataProfileInputRequestsColumnPatternProfileRequest] (
    [DataSourceID]                  VARCHAR (255) NULL,
    [Delimiters]                    VARCHAR (255) NULL,
    [ID]                            VARCHAR (255) NULL,
    [MaxNumberOfPatterns]           INT           NULL,
    [PercentageDataCoverageDesired] INT           NULL,
    [Symbols]                       VARCHAR (255) NULL,
	[ExecutionID] UNIQUEIDENTIFIER		NOT NULL
);

