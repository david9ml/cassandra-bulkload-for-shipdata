CREATE KEYSPACE IF NOT EXISTS test_bulkloader WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE test_bulkloader;
CREATE TABLE IF NOT EXISTS target_history(
    unique_id varchar,
    acquisition_time varchar,
    primary key(unique_id,acquisition_time)
);
