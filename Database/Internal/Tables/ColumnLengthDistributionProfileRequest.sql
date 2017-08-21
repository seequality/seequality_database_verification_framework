CREATE TABLE [Internal].[ColumnLengthDistributionProfileRequest] (
    [Table]               VARCHAR (255) NULL,
    [Schema]              VARCHAR (255) NULL,
    [IgnoreTrailingSpace] BIT           NULL,
    [IgnoreLeadingSpace]  BIT           NULL,
    [ID]                  VARCHAR (255) NULL,
    [DataSourceID]        VARCHAR (255) NULL,
    [ColumnIsWildCard]    BIT           NULL,
    [ExecutionID]         INT           NULL
);



