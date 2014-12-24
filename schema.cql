CREATE KEYSPACE IF NOT EXISTS test_bulkloader WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE test_bulkloader;
CREATE TABLE IF NOT EXISTS target_history(
    unique_id varchar,
    acquisition_time varchar,
    target_type int,
    data_source int,
    status int,
    longitude varchar,
    latitude varchar,
    speed double,
    conversion double,
    add1 double,
    add2 int,
    cog int,
    true_head int,
    power int,
    extend varchar,
    primary key(unique_ID,acquisition_time)
    );

