CREATE TABLE [Internal].[ColumnValueDistributionProfileOutput] (
    [ColumnCodePage]             INT            NULL,
    [ColumnIsNullable]           BIT            NULL,
    [ColumnLCID]                 INT            NULL,
    [ColumnMaxLength]            INT            NULL,
    [ColumnName]                 NVARCHAR (255) NULL,
    [ColumnPrecision]            INT            NULL,
    [ColumnScale]                INT            NULL,
    [ColumnSqlDbType]            NVARCHAR (255) NULL,
    [ColumnStringCompareOptions] INT            NULL,
    [DataSourceID]               NVARCHAR (255) NULL,
    [NumberOfDistinctValues]     INT            NULL,
    [IsExact]                    BIT            NULL,
    [ProfileRequestID]           NVARCHAR (255) NULL,
    [TableDatabase]              NVARCHAR (255) NULL,
    [TableDataSource]            NVARCHAR (255) NULL,
    [TableRowCount]              INT            NULL,
    [TableSchema]                NVARCHAR (255) NULL,
    [TableName]                  NVARCHAR (255) NULL,
    [ValueDistributionValue]     NVARCHAR (255) NULL,
    [ValueDistributionCount]     INT            NULL,
    [ExecutionID]                INT            NULL
);



