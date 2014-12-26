# cassandra-bulkload-example 

Sample SSTable generating and bulk loading code for 中国航运中心 ship data csv.

## Generating SSTables

Run:

    $ ./gradlew run

This will generate SSTable(s) under `data` directory.

## Bulk loading

First, create schema using `schema.cql` file:

    $ cqlsh -f schema.cql

Then, load SSTables to Cassandra using `sstableloader`:

    $ sstableloader -d <ip address of the node> data/test_bulkloader/target_history

(assuming you have `cqlsh` and `sstableloader` in your `$PATH`)

## Check loaded data example

    $ bin/cqlsh
    Connected to Test Cluster at 127.0.0.1:9042.
    [cqlsh 5.0.1 | Cassandra 2.1.0 | CQL spec 3.2.0 | Native protocol v3]
    Use HELP for help.
    cqlsh> USE quote ;
    cqlsh:quote> SELECT * FROM historical_prices WHERE ticker = 'ORCL' LIMIT 3;

     ticker | date                     | adj_close | close | high  | low   | open  | volume
    --------+--------------------------+-----------+-------+-------+-------+-------+----------
       ORCL | 2014-09-25 00:00:00-0500 |     38.76 | 38.76 | 39.35 | 38.65 | 39.35 | 13287800
       ORCL | 2014-09-24 00:00:00-0500 |     39.42 | 39.42 | 39.56 | 38.57 | 38.77 | 18906200
       ORCL | 2014-09-23 00:00:00-0500 |     38.83 | 38.83 | 39.59 | 38.80 | 39.50 | 34353300

    (3 rows)

OK!
