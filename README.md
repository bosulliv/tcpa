# TCPA
This is a test script to benchmark the speed of R finding the intersection of two large lists of DDI's. The time included loading the TCPA do not call file (250 million lines of csv), and a large customer list of numbers to test for intersection (25 million lines of CSV).

This completed in under a minute on a macbook air and used 1GB of memory (1.6Ghz i5, 8GB RAM, SSD).

The redis equivalent approach took 5-10 minutes.

## Future
It's worth testing sqlite3, and mysql using inner join with similar data load, inner join, then sqldump.
