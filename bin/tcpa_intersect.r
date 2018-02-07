library(data.table)
library(lubridate)

# cleanse memory before run
rm(list=ls())
gc()

# data prep - remove comma
# sed -e s/,//g tcpa_raw.csv > ddi.csv
# sed -e s/,//g 1M.csv > 1M_clean.csv

# benchmark
start <- now()

# data table will coerce to integer64
# That is fine for E164 intersection
setwd("~/Documents/Code/R/tcpa")
ddis <- fread("./data/ddi.csv", col.names = c("ddis"))
cust_ddis <- fread("./data/1M_clean.csv", col.names = c("ddis"))

# build index
setkey(ddis, ddis)
setkey(cust_ddis, ddis)

# inner join & write file
ddi_interesct <- ddis[cust_ddis, nomatch=0]
fwrite(ddi_interesct, "./data/ddi_intersect.csv")

# benchmark
# 35 seconds on 1.6GHz airbook, 1GB memory use
now() - start

# test against random DDI sample
rand_ddis <- data.table(ddis = runif(25000000, min = 2000001234, max = 9900001234))
setkey(rand_ddis, ddis)
rand_intersect <- ddis[rand_ddis, nomatch=0]
fwrite(rand_intersect, "./data/rand_intersect.csv")