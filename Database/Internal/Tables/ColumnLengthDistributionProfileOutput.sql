﻿CREATE TABLE [Internal].[ColumnLengthDistributionProfileOutput] (
    [ColumnCodePage]             INT           NULL,
    [ColumnIsNullable]           BIT           NULL,
    [ColumnLCID]                 INT           NULL,
    [ColumnMaxLength]            INT           NULL,
    [ColumnName]                 VARCHAR (255) NULL,
    [ColumnPrecision]            INT           NULL,
    [ColumnScale]                INT           NULL,
    [ColumnSqlDbType]            VARCHAR (255) NULL,
    [ColumnStringCompareOptions] INT           NULL,
    [DataSourceID]               VARCHAR (255) NULL,
    [IgnoreLeadingSpace]         BIT           NULL,
    [IgnoreTrailingSpace]        BIT           NULL,
    [IsExact]                    BIT           NULL,
    [MaxLength]                  INT           NULL,
    [MinLength]                  INT           NULL,
    [ProfileRequestID]           VARCHAR (255) NULL,
    [TableDatabase]              VARCHAR (255) NULL,
    [TableDataSource]            VARCHAR (255) NULL,
    [TableRowCount]              INT           NULL,
    [TableSchema]                VARCHAR (255) NULL,
    [TableName]                  VARCHAR (255) NULL,
    [LengthDistributionLength]   INT           NULL,
    [LengthDistributionCount]    INT           NULL,
    [ExecutionID]                INT           NULL
);



