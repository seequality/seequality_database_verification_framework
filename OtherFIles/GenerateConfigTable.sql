WITH cteAllTables AS 
(
	SELECT 	QUOTENAME(s.name) AS [SchemaName], 
QUOTENAME(t.name) AS [TableName]
		FROM sys.schemas s 
	INNER JOIN sys.tables t ON s.schema_id = t.schema_id
), cteCountRows AS 
(
	SELECT
		QUOTENAME(SCHEMA_NAME(sOBJ.schema_id)) AS [SchemaName]
		, QUOTENAME(sOBJ.name) AS [TableName]
		, SUM(sPTN.Rows) AS [RowCount]
	FROM 
		sys.objects AS sOBJ
		INNER JOIN sys.partitions AS sPTN
			ON sOBJ.object_id = sPTN.object_id
	WHERE
		sOBJ.type = 'U'
		AND sOBJ.is_ms_shipped = 0x0
		AND index_id < 2 -- 0:Heap, 1:Clustered
	GROUP BY 
		sOBJ.schema_id
		, sOBJ.name
), cteCountColumns AS 
(
SELECT 
QUOTENAME(s.name) AS [SchemaName], 
QUOTENAME(t.name) AS [TableName], 
COUNT(c.column_id) AS [ColumnCount],
SUM(CASE WHEN ty.name = 'nvarchar' THEN 1 ELSE 0 end) AS NumberOfNVarcharColumns
FROM sys.schemas s
INNER JOIN sys.tables t 
ON s.schema_id = t.schema_id
INNER JOIN sys.columns c
ON t.object_id = c.object_id
INNER JOIN sys.types ty
ON c.user_type_id = ty.user_type_id
GROUP BY s.name,
t.name
)
SELECT 
	a.SchemaName,
	a.TableName,
	b.[RowCount],
	c.ColumnCount,
	c.NumberOfNVarcharColumns,
	CONVERT(BIT, 0) AS [GenerateView],
	CONVERT(NVARCHAR(255),NULL) AS [DateColumnFilter],
	CONVERT(INT,NULL) AS NumberOfDaysBack,
	convert(bit,1) as [ColumnLengthDistributionProfileOutput],
	convert(bit,1) as [ColumnStatisticsProfileOutput],
	convert(bit,1) as [ColumnNullRatioProfileOutput],
	convert(bit,1) as [ColumnValueDistributionProfileOutput],
	convert(bit,1) as [ProfilesColumnPatternProfileOutput]
FROM cteAllTables a
INNER JOIN cteCountRows b ON a.SchemaName = b.SchemaName AND a.TableName = b.TableName
INNER JOIN cteCountColumns c ON a.SchemaName = c.SchemaName AND a.TableName = c.TableName










