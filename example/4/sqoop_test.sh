sqoop export --connect jdbc:mysql://localhost:3306/hive --username root --password hadoop --table STATISTICS_BY_BUSINESS_TYPE --export-dir /apps/hive/warehouse/hive_edu.db/statistics_by_business_type
