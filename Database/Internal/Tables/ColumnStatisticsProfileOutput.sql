﻿CREATE TABLE [Internal].[ColumnStatisticsProfileOutput] (
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
    [IsExact]                    BIT            NULL,
    [ProfileRequestID]           NVARCHAR (255) NULL,
    [TableDatabase]              NVARCHAR (255) NULL,
    [TableDataSource]            NVARCHAR (255) NULL,
    [TableRowCount]              INT            NULL,
    [TableSchema]                NVARCHAR (255) NULL,
    [TableName]                  NVARCHAR (255) NULL,
    [MaxValue]                   NVARCHAR (255) NULL,
    [Mean]                       NUMERIC (18)   NULL,
    [MeanSpecified]              BIT            NULL,
    [MinValue]                   NVARCHAR (255) NULL,
    [StdDev]                     NUMERIC (18)   NULL,
    [StdDevSpecified]            BIT            NULL,
    [ExecutionID]                INT            NULL
);



