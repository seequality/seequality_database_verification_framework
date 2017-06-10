CREATE TABLE [Internal].[ColumnPatternProfileRequest] (
    [ColumnIsWildCard]              BIT           NULL,
    [DataSourceID]                  VARCHAR (255) NULL,
    [ID]                            VARCHAR (255) NULL,
    [Schema]                        VARCHAR (255) NULL,
    [Table]                         VARCHAR (255) NULL,
    [CaseSensitive]                 BIT           NULL,
    [Delimiters]                    VARCHAR (255) NULL,
    [MaxNumberOfPatterns]           VARCHAR (255) NULL,
    [PercentageDataCoverageDesired] VARCHAR (255) NULL,
    [Symbols]                       VARCHAR (255) NULL,
    [TagDataSourceId]               VARCHAR (255) NULL,
    [TagTableName]                  VARCHAR (255) NULL
);

