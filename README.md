# TCPA
This is a test script to benchmark the speed of R finding the intersection of two large lists of DDI's. The time included loading the TCPA do not call file (250 million lines of csv), and a large customer list of numbers to test for intersection (25 million lines of CSV).

This completed in under a minute on a macbook air and used 1GB of memory (1.6Ghz i5, 8GB RAM, SSD).

The redis equivalent approach on 8 core 2.7Ghz Xeon servers with 24GB of memory took 5-10 minutes.

## SQLite3
Let's baseline with some quick and dirty alternatives. SQLite3 is faster than out of the box MySQL for this task:

   `# sqlite3 ddi.sql3
   create table tcpa (ddis integer);
   .import ../data/ddi.csv tcpa`

I killed it after 4 minutes - will try with 1M rows and extrapolate:

   `.import ../data/1M_clear.csv tcpa`

That took 1 second - so I probably killed it before it was about to complete: Run again to completion so we can compare inner join performance. This is something MySQL is likely to outperform.

