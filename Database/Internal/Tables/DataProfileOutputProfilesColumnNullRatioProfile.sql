CREATE TABLE [Internal].[DataProfileOutputProfilesColumnNullRatioProfile] (
    [DataSourceID]     VARCHAR (255) NULL,
    [IsExact]          BIT           NULL,
    [NullCount]        INT           NULL,
    [ProfileRequestID] VARCHAR (255) NULL,
	[ExecutionID] UNIQUEIDENTIFIER		NOT NULL
);

