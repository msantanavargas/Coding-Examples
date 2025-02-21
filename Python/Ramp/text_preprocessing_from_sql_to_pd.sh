#! /bin/bash

# export data beginning from the 9th line and remove parenthesis, single quote and semicolon: ()';
tail -n +9 ./schema.sql | sed "s/(//g; s/)//g; s/'//g; s/;//g" >> my_raw_data.txt

