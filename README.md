#General info
This is the POC of the data verification freamwork build in SSIS + BIML

#Tables description
##[Internal].[DataSources]
Note: There will be some duplicates. The task is saving all of the connection manager details to the output file. In the table you will find the connection details to all of your files plus the connection details to the database - the data source of the data that we are analysing. Becouse this information exists in all of the files you will have the duplicates. Please note that in another tables you will find the reference only for the database connection.
##[Internal].[ColumnValueDistributionProfileRequest]
No issues has been found.
##[Internal].[ColumnLengthDistributionProfileRequest]
No issues has been found.
##[Internal].[ColumnPatternProfileRequest]
Note: The TagDataSourceId and TagTableName settings are not supported at this moment.
No issues has been found.
##[Internal].[ColumnStatisticsProfileRequest]
No issues has been found.
##[Internal].[ColumnNullRatioProfileRequest]
No issues has been found.
##[Internal].[ColumnLengthDistributionProfileOutput]
No issues has been found.
##[Internal].[ColumnStatisticsProfileOutput]
No issues has been found.
##[Internal].[ColumnNullRatioProfileOutput]
Note: In the case when the column is not nullable the task is setting up the TableRowCount column to -1
No issues has been found.
##[Internal].[ProfilesColumnPatternProfileOutput]
No issues has been found.