# what the program about?
This program is about practicing basic python programming skill with song recommendation from Spotify's list
Data source is from Kaggle at: [Link](https://www.kaggle.com/code/hainescity/spotify-dataset-eda/input)

# what's my key learning from this?
The key learning is about how to slice and access data in DataFrame for specific scope

# what can be improved?
The program can be improved by using API to acquire updated and customized playlist for user
Also, OOP coding style can be obtained for better flow and control over code
Able to ping directly the song on Spotify

# what are some new functions, practices that I learned?
## create a unique list or no-duplicate dataframe:
df['genre'].unique() -> unique() is used for 1D array or series only
df[['genre','artists']].drop_duplicates() -> drop_duplicates() can be applied to 2D or dataframe

## index directly to a series
genre[selection]

## rename_axis:
df.rename_axis takes in the new name and specified which axis (0 or 1) to replace

## change the index of a list or dataframe:
df.index = range(...)

## tuple can be indexed via [...]

## to_list help convert index into a list so that for loop can be applied

## pd.set_option('display.max_rows', None) -> print all rows in df