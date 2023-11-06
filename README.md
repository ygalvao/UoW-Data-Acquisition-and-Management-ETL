# Simple ETL - Assignment 5 - Data Acquisition and Management - AI - The University of Winnipeg

## Overview
This project is a simple Extract, Transform, Load (ETL) data pipeline using Bash, Python, and PSQL.

## Prerequisites
- Python 3.7 or higher
- Pandas 1.5.3 or higher
- Bash shell
- PSQL

## Project Structure
- `transform.py`: Python script responsible for transforming the data.
- `etl.sh`: Bash script that orchestrates the ETL process and does the extraction and loading of the data.

## Running the ETL Pipeline
To run the ETL pipeline, execute the `etl.sh` from your terminal (after making it executable).

```bash
chmod +x etl.sh
./etl.sh
```

This script will call transform.py as part of its process.

## Customizing the Pipeline
The transformation logic can be customized by editing the transform.py script.

## License
MIT - see the LICENSE file for more details.
