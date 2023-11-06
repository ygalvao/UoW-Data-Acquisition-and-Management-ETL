#!/usr/bin/env python3

### This is a simple Python script to do the "Transform" step of the ETL process of the file "web-server-access-log.txt"

### This script will get the data from "web-server-access-log.txt", transform it, and then load it into the file "transformed.csv",
# in preparation for the "Load" step of the ETL process (in this case, load to a PostegreSQL database).

import pandas as pd # We only need Pandas to do this simple transformation

df = pd.read_csv('web-server-access-log.txt', sep='#') # Imports the data from the txt file into a Pandas DataFrame
df.timestamp = pd.to_datetime(df.timestamp) # Corrects the dtype of "timestamp" column from object (string) to datetime64 (timestamp)
df.to_csv('transformed.csv') # Exports the DataFrame to a CSV file
