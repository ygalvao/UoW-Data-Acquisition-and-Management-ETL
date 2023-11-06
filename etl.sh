#!/usr/bin/bash

### This script will perform an Extract, Transform, and Load (ETL) process from the file web-server-access-log.txt.gz to a PostgreSQL
# database.

# Step 1 - Extract
wget https://elasticbeanstalk-us-east-2-340729127361.s3.us-east-2.amazonaws.com/web-server-access-log.txt.gz # Downloads the file

gzip -dk web-server-access-log.txt.gz # Unzips the .gz file, extracting the .txt file


# Step 2 - Transform
python transform.py # Runs the Python script that will handle the Transformation phase.


# Step 3 - Load
read -p "Enter the exact name of your Linux superuser (the one with 'sudo' capability):" user # Gets the name of the superuser, in
# order to use an user with the same name within PostgreSQL, to avoid permission problems when using PSQL to read the CSV file

path=$(pwd)/transformed.csv # Gets the path for the current directory and then completes it with the path for the transformed data file

### For this script to work, you just need to have PostgreSQL installed and running, and the username
# must be a superuser in your Linux distro and an active user in Postgre as well.

### Below we are telling Postgre to create the necessary table and to populate it with the transformed data.
(echo "\c template1" & echo "CREATE TABLE ingress_log (id INT PRIMARY KEY, timestamp TIMESTAMP, latitude FLOAT, longitude FLOAT, visitorid VARCHAR(37), accessed_from_mobile BOOLEAN, browser_code INT);") | sudo -u $user psql # Creates the necessary table, with the necessary schema

echo "\COPY ingress_log FROM '$path' CSV HEADER;" | sudo -u $user psql

