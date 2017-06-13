CREATE VIEW [Reporting].[ColumnNullRatioProfileOutput_Last10Executions]
AS WITH cteExecutions
   AS (
      SELECT   TOP 10 ExecutionID ,
               ROW_NUMBER() OVER ( ORDER BY ExecutionTime DESC ) AS rn
      FROM     Internal.ExecutionLog
      ORDER BY ExecutionTime DESC
      ) ,
        cteSourceData
   AS ( SELECT a.ExecutionID ,
               b.rn ,
               a.ColumnCodePage ,
               a.ColumnIsNullable ,
               a.ColumnLCID ,
               a.ColumnMaxLength ,
               a.ColumnName ,
               a.ColumnPrecision ,
               a.ColumnScale ,
               a.ColumnSqlDbType ,
               a.ColumnStringCompareOptions ,
               a.TableDatabase ,
               a.TableDataSource ,
               a.TableRowCount ,
               a.TableSchema ,
               a.TableName ,
               a.IsExact ,
               a.NullCount ,
               a.ProfileRequestID
        FROM   [Internal].[ColumnNullRatioProfileOutput] a
               INNER JOIN cteExecutions b ON a.ExecutionID = b.ExecutionID
      ) ,
        cteOutputNullCount
   AS ( SELECT pvt.TableSchema ,
               pvt.TableName ,
               pvt.ColumnName ,
               pvt.[10] AS [10_NullCount] ,
               pvt.[9] AS [9_NullCount] ,
               pvt.[8] AS [8_NullCount] ,
               pvt.[7] AS [7_NullCount] ,
               pvt.[6] AS [6_NullCount] ,
               pvt.[5] AS [5_NullCount] ,
               pvt.[4] AS [4_NullCount] ,
               pvt.[3] AS [3_NullCount] ,
               pvt.[2] AS [2_NullCount] ,
               pvt.[1] AS [1_NullCount] ,
               CONVERT(
                          BIT ,
                          IIF(
                              [1] + [2] + [3] + [4] + [5] + [6] + [7] + [8]
                              + [9] + [10] > 0 ,
                              1 ,
                              0)
                      ) AS AtLeastOneNull ,
               CONVERT(
                          BIT ,
                          IIF(
                              [1] + [2] + [3] + [4] + [5] + [6] + [7] + [8]
                              + [9] + [10] = [1] * 10 ,
                              0 ,
                              1)
                      ) AS AtLeastOneChange
        FROM   (   SELECT rn ,
                          TableSchema ,
                          TableName ,
                          ColumnName ,
                          NullCount
                   FROM   cteSourceData
               ) x
        PIVOT (   MAX(NullCount)
                  FOR rn IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9] ,
                              [10]
                            )
              ) AS pvt
      ) ,
        cteServerExecutionID
   AS ( SELECT pvt.TableSchema ,
               pvt.TableName ,
               pvt.ColumnName ,
               pvt.[10] AS [10_ServerExecutionID] ,
               pvt.[9] AS [9_ServerExecutionID] ,
               pvt.[8] AS [8_ServerExecutionID] ,
               pvt.[7] AS [7_ServerExecutionID] ,
               pvt.[6] AS [6_ServerExecutionID] ,
               pvt.[5] AS [5_ServerExecutionID] ,
               pvt.[4] AS [4_ServerExecutionID] ,
               pvt.[3] AS [3_ServerExecutionID] ,
               pvt.[2] AS [2_ServerExecutionID] ,
               pvt.[1] AS [1_ServerExecutionID]
        FROM   (   SELECT a.rn ,
                          a.TableSchema ,
                          a.TableName ,
                          a.ColumnName ,
                          b.ServerExecutionID
                   FROM   cteSourceData a
                          INNER JOIN Internal.ExecutionLog b ON a.ExecutionID = b.ExecutionID
               ) x
        PIVOT (   MAX(ServerExecutionID)
                  FOR rn IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9] ,
                              [10]
                            )
              ) AS pvt
      ) ,
        cteExecutionTime
   AS ( SELECT pvt.TableSchema ,
               pvt.TableName ,
               pvt.ColumnName ,
               pvt.[10] AS [10_ExecutionTime] ,
               pvt.[9] AS [9_ExecutionTime] ,
               pvt.[8] AS [8_ExecutionTime] ,
               pvt.[7] AS [7_ExecutionTime] ,
               pvt.[6] AS [6_ExecutionTime] ,
               pvt.[5] AS [5_ExecutionTime] ,
               pvt.[4] AS [4_ExecutionTime] ,
               pvt.[3] AS [3_ExecutionTime] ,
               pvt.[2] AS [2_ExecutionTime] ,
               pvt.[1] AS [1_ExecutionTime]
        FROM   (   SELECT a.rn ,
                          a.TableSchema ,
                          a.TableName ,
                          a.ColumnName ,
                          b.ExecutionTime
                   FROM   cteSourceData a
                          INNER JOIN Internal.ExecutionLog b ON a.ExecutionID = b.ExecutionID
               ) x
        PIVOT (   MAX(ExecutionTime)
                  FOR rn IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9] ,
                              [10]
                            )
              ) AS pvt
      ) ,
        cteOutputRowCount
   AS ( SELECT pvt.TableSchema ,
               pvt.TableName ,
               pvt.ColumnName ,
               pvt.[10] AS [10_RowCount] ,
               pvt.[9] AS [9_RowCount] ,
               pvt.[8] AS [8_RowCount] ,
               pvt.[7] AS [7_RowCount] ,
               pvt.[6] AS [6_RowCount] ,
               pvt.[5] AS [5_RowCount] ,
               pvt.[4] AS [4_RowCount] ,
               pvt.[3] AS [3_RowCount] ,
               pvt.[2] AS [2_RowCount] ,
               pvt.[1] AS [1_RowCount]
        FROM   (   SELECT rn ,
                          TableSchema ,
                          TableName ,
                          ColumnName ,
                          cteSourceData.TableRowCount
                   FROM   cteSourceData
               ) x
        PIVOT (   MAX(TableRowCount)
                  FOR rn IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9] ,
                              [10]
                            )
              ) AS pvt
      ) ,
        cteOutputExecutionID
   AS ( SELECT pvt.TableSchema ,
               pvt.TableName ,
               pvt.ColumnName ,
               pvt.[10] AS [10_ExecutionID] ,
               pvt.[9] AS [9_ExecutionID] ,
               pvt.[8] AS [8_ExecutionID] ,
               pvt.[7] AS [7_ExecutionID] ,
               pvt.[6] AS [6_ExecutionID] ,
               pvt.[5] AS [5_ExecutionID] ,
               pvt.[4] AS [4_ExecutionID] ,
               pvt.[3] AS [3_ExecutionID] ,
               pvt.[2] AS [2_ExecutionID] ,
               pvt.[1] AS [1_ExecutionID]
        FROM   (   SELECT rn ,
                          TableSchema ,
                          TableName ,
                          ColumnName ,
                          TableRowCount ,
                          cteSourceData.ExecutionID
                   FROM   cteSourceData
               ) x
        PIVOT (   MAX(ExecutionID)
                  FOR rn IN ( [1], [2], [3], [4], [5], [6], [7], [8], [9] ,
                              [10]
                            )
              ) AS pvt
      ) ,
        cteOutputColumnDetails
   AS ( SELECT   a.TableSchema ,
                 a.TableName ,
                 a.ColumnName ,
                 a.ColumnCodePage ,
                 a.ColumnIsNullable ,
                 a.ColumnLCID ,
                 a.ColumnMaxLength ,
                 a.ColumnPrecision ,
                 a.ColumnScale ,
                 a.ColumnSqlDbType ,
                 a.ColumnStringCompareOptions ,
                 a.IsExact ,
                 a.ProfileRequestID
        FROM     cteSourceData a
        GROUP BY a.ColumnCodePage ,
                 a.ColumnIsNullable ,
                 a.ColumnLCID ,
                 a.ColumnMaxLength ,
                 a.ColumnName ,
                 a.ColumnPrecision ,
                 a.ColumnScale ,
                 a.ColumnSqlDbType ,
                 a.ColumnStringCompareOptions ,
                 a.TableDatabase ,
                 a.TableDataSource ,
                 a.TableSchema ,
                 a.TableName ,
                 a.IsExact ,
                 a.ProfileRequestID
      )
SELECT a.TableSchema ,
       a.TableName ,
       a.ColumnName ,
       a.ColumnCodePage ,
       a.ColumnIsNullable ,
       a.ColumnLCID ,
       a.ColumnMaxLength ,
       a.ColumnPrecision ,
       a.ColumnScale ,
       a.ColumnSqlDbType ,
       a.ColumnStringCompareOptions ,
       a.IsExact ,
       a.ProfileRequestID ,
       b.[10_NullCount] ,
       b.[9_NullCount] ,
       b.[8_NullCount] ,
       b.[7_NullCount] ,
       b.[6_NullCount] ,
       b.[5_NullCount] ,
       b.[4_NullCount] ,
       b.[3_NullCount] ,
       b.[2_NullCount] ,
       b.[1_NullCount] ,
       b.AtLeastOneNull ,
       b.AtLeastOneChange ,
       c.[10_RowCount] ,
       c.[9_RowCount] ,
       c.[8_RowCount] ,
       c.[7_RowCount] ,
       c.[6_RowCount] ,
       c.[5_RowCount] ,
       c.[4_RowCount] ,
       c.[3_RowCount] ,
       c.[2_RowCount] ,
       c.[1_RowCount] ,
       d.[10_ExecutionID] ,
       d.[9_ExecutionID] ,
       d.[8_ExecutionID] ,
       d.[7_ExecutionID] ,
       d.[6_ExecutionID] ,
       d.[5_ExecutionID] ,
       d.[4_ExecutionID] ,
       d.[3_ExecutionID] ,
       d.[2_ExecutionID] ,
       d.[1_ExecutionID],
       e.[10_ServerExecutionID] ,
       e.[9_ServerExecutionID] ,
       e.[8_ServerExecutionID] ,
       e.[7_ServerExecutionID] ,
       e.[6_ServerExecutionID] ,
       e.[5_ServerExecutionID] ,
       e.[4_ServerExecutionID] ,
       e.[3_ServerExecutionID] ,
       e.[2_ServerExecutionID] ,
       e.[1_ServerExecutionID],
       f.[10_ExecutionTime] ,
       f.[9_ExecutionTime] ,
       f.[8_ExecutionTime] ,
       f.[7_ExecutionTime] ,
       f.[6_ExecutionTime] ,
       f.[5_ExecutionTime] ,
       f.[4_ExecutionTime] ,
       f.[3_ExecutionTime] ,
       f.[2_ExecutionTime] ,
       f.[1_ExecutionTime]
FROM   cteOutputColumnDetails a
       INNER JOIN cteOutputNullCount b ON a.TableSchema = b.TableSchema
                                          AND a.TableName = b.TableName
                                          AND a.ColumnName = b.ColumnName
       INNER JOIN cteOutputRowCount c ON a.TableSchema = c.TableSchema
                                         AND a.TableName = c.TableName
                                         AND a.ColumnName = c.ColumnName
       INNER JOIN cteOutputExecutionID d ON a.TableSchema = d.TableSchema
                                            AND a.TableName = d.TableName
                                            AND a.ColumnName = d.ColumnName
       INNER JOIN cteServerExecutionID e ON a.TableSchema = e.TableSchema
                                            AND a.TableName = e.TableName
                                            AND a.ColumnName = e.ColumnName
       INNER JOIN cteExecutionTime f ON a.TableSchema = f.TableSchema
                                        AND a.TableName = f.TableName
                                        AND a.ColumnName = f.ColumnName;