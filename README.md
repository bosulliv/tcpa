# TCPA
This is a test script to benchmark the speed of R finding the intersection of two large lists of DDI's. The time included loading the TCPA do not call file (250 million lines of csv), and a large customer list of numbers to test for intersection (25 million lines of CSV).

This completed in under a minute on a macbook air and used 1GB of memory (1.6Ghz i5, 8GB RAM, SSD).

The redis equivalent approach on 8 core 2.7Ghz Xeon servers with 24GB of memory took 5-10 minutes.

## SQLite3
Let's baseline with some quick and dirty alternatives. SQLite3 is faster than out of the box MySQL for import, although like slower for inner join:

Import - 6 minutes.

    # sqlite3 ddi.sql3
    create table tcpa (ddis integer primary key);
    .import ../data/ddi.csv tcpa
    create table cust_ddis (ddis integer primary key);
    .import ../data/1M_clean.csv cust_ddis

Then inner join - 2 minutes.

    select count(*) from tcpa inner join cust_ddis on tcpa.ddis = cust_ddis.ddis;

Total = 8 minutes. Much slower, and haven't written to disk.
