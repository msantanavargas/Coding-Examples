# Data Engineering

In this example, data is provided as a raw [SQL data table schema file](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/DataSource/schema.sql). The file contains daily data values and the objective is to calculate rolling averages per day. 

I try to organize files by steps. Every file has a prefix corresponding to the step below.

The logic goes as follows:

1. Import - Transform from SQL code file to a pandas usable text file via [bash](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/01_text_preprocessing_from_sql_to_pd.sh) generating a [raw text file](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/my_raw_data.txt)
2. Process in Pandas - this step assumes there is no process in place yet, so this file is just a demonstration on how to do adhoc analysis that later is replicated in production. The text file produced earliercan then be imported into dataframe and calculate rolling 3-day average via window function in a [python notebook](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/02_3-day-rolling_average.ipynb). As mentioned, this is normally done as one-time analysis item.
3. Once the logic is figured out, put this in a [python production file](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/03_analytics.py) for a regular (daily) run. This can be run locally or can be done as per next step.
4. The daily run can be run as a docker container image with a jobs system, like airflow, for example with these [AWS tools](https://github.com/msantanavargas/Coding-Examples/tree/main/AWS) and eitherlocally, or in the server or inside the container run `python3 analytics.py`
