import pandas as pd

#########################
# Importing Data        #
#########################
my_file_name = 'my_raw_data.txt'
print('### IMPORTING DATA ###')
try:
    my_data = pd.read_csv(my_file_name, sep=",", header=None, usecols=[0,1]) # Dropping white spaces at the end (third column)
    my_data.columns = ["transaction_time", "transaction_amount"]
    my_data.transaction_time = pd.to_datetime(my_data.transaction_time)  # convert to Date/Time
    my_data['transaction_amount'] = my_data['transaction_amount'].astype(float) # convert to float
    print(f'### Imported file: {my_file_name} ###')
    print(f'### Imported {my_data.shape[0]} rows ###')
except:
    print(f'### ERROR Importing Data file: {my_file_name} ')

#########################
# Data Quality Checks   #
#########################

print('### Data Quality Checks ###')
my_nonzero_check = (my_data['transaction_amount'] > 0).all()
print(f'Checking if all transactions are non-zero: {my_nonzero_check}')


#########################
# Calculating Metrics   #
#########################

# Group by Date and Sum transactions per date
print('### Calculating Transactions per Day ###')
my_summary_date = my_data['transaction_amount'].groupby([my_data['transaction_time'].dt.date]).sum() # Get stotals per day
my_summary_date.index = pd.to_datetime(my_summary_date.index) # transform grouped dates to date types

#Calculate 3-day window averages per day
print('### Calculating 3-Day Window Averages ###')
my_rolling_averages = my_summary_date.rolling(window=3).mean() # Do 3 day rolling window mean
my_rolling_averages.index = pd.to_datetime(my_rolling_averages.index) # transform grouped dates to date types


#########################
# Exporting Output file #
#########################
my_output_file_name = 'my_output_data.txt'
try:
    print('### Exporting file ###')
    my_rolling_averages.to_csv(my_output_file_name, index=True)
    print(f'### Exported file: {my_output_file_name} ###')
except:
    print(f'### ERROR Exporting Data file: {my_output_file_name} ')