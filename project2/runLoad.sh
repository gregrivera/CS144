#!/bin/bash
 
#Parth and Greg runLoad.sh   
  
mysql CS144 < drop.sql
mysql CS144 < create.sql

# Compile and run the parser to generate the appropriate load files
ant
ant run-all


# Duplicate Removal
# removed duplicates in files called nodup_*
sort -u items.dat > nodup_items.dat
sort -u item_category.dat > nodup_item_category.dat
sort -u users.dat > nodup_users.dat
sort -u bids.dat  > nodup_bids.dat




# Run the load.sql batch file to load the data
mysql CS144 < load.sql

# Remove all temporary files
rm *.dat 
rm load.sql
