# Data Engineering

In this example, data is provided as a raw [SQL data table schema file](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/schema.sql). The file contains daily data values and the objective is to calculate rolling averages per day. 

The logic goes as follows:

1. Import - Transform from SQL to pandas via [bash](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/text_preprocessing_from_sql_to_pd.sh) generating a [raw text file](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/my_raw_data.txt)
2. Process in Pandas - The tgext file can then be imported into dataframe and calculate rolling 3-day average via window function in a [python notebook](https://github.com/msantanavargas/Coding-Examples/blob/main/Python/data_engineering/3-day-rolling_average.ipynb).
