CREATE TABLE [Internal].[DataProfileOutputProfilesColumnStatisticsProfile] (
    [DataSourceID]     VARCHAR (255)   NULL,
    [IsExact]          BIT             NULL,
    [MaxValue]         VARCHAR (255)   NULL,
    [Mean]             NUMERIC (18, 4) NULL,
    [MeanSpecified]    BIT             NULL,
    [MinValue]         VARCHAR (255)   NULL,
    [ProfileRequestID] VARCHAR (255)   NULL,
    [StdDev]           NUMERIC (18, 4) NULL,
    [StdDevSpecified]  BIT             NULL,
	[ExecutionID] UNIQUEIDENTIFIER		NOT NULL
);

