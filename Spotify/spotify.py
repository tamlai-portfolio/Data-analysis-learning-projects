# import libraries
import pandas as pd
import numpy as np

# loading data from CSV file
df = pd.read_csv('./spotify_tracks.csv')
df = df.rename_axis("s_id",axis=0)

# create list of genre
genre = pd.Series(df['genre'].unique(),name='genre')
genre.index = range(1, len(genre)+1)
genre = genre.rename_axis("id",axis=0)

# return list of songs from selected genre and artist
def main():
    tuple_list = get_artist()
    song_list = df[(df['artists'] == tuple_list[0]) & (df['genre'] == tuple_list[1])][['genre','artists','name','album']]
    pd.set_option('display.max_rows', None)
    print(song_list)
    while True:
        try:
            song_choice = int(input('Select your song by id or press 0 for other recommendations '))
            if song_choice in song_list.index.to_list():
                print("Now playing", song_list.loc[song_choice,'name'], "by", song_list.loc[song_choice,'artists'])
                break
            elif song_choice == 0:
                user_choice()
                break
        except (ValueError,NameError):
            print("Please select by song_id or press 0")
            continue

# return all artists in chosen genre
def get_artist():
    artist_by_genre = df[['genre','artists']].drop_duplicates()
    artist_by_genre.index = range(1,len(artist_by_genre) + 1)
    artist_by_genre = artist_by_genre.rename_axis("artist_genre_id",axis=0)
    artist_by_genre = artist_by_genre[artist_by_genre['genre'] == user_choice()]
    while True:
        pd.set_option('display.max_rows', None)
        print(artist_by_genre)
        try:
            artist_choice = int(input('Select your artist by id or press 0 for other recommendations '))
            if artist_choice in artist_by_genre.index.to_list():
                a = artist_by_genre.loc[artist_choice, 'artists']
                g = artist_by_genre.loc[artist_choice, 'genre']
                return a, g
            elif artist_choice == 0:
                user_choice()
                break
        except (ValueError,NameError):
            print("Please select by artist_id or press 0")
            continue

# ask user whether they want to select or reccommend a genre
def user_choice():
    choice = pd.Series({0: 'recommendation', 1: 'self selection'})
    while True:
        for index, value in choice.items():
            print(f"{index}    {value}")
        try:
            user = int(input('Please choose your option: '))
            if user == 0:
                return get_genre(genre.sample(10))
            elif user == 1:
                return get_genre(genre)
            else:
                print('Please select 0 or 1')
                continue
        except (ValueError, NameError):
            print('Please select 0 or 1 ')
            continue

# prompting user with random list and ask for selection
def get_genre(gen_list):
    while True:
        print(gen_list.to_string())
        try:
            selection = int(input('What genre you want to listen to? Press 0 for other recommendations '))
            if selection in gen_list.index.to_list():
                return genre[selection]
            elif selection == 0:
                gen_list = genre.sample(10)
                continue
            else:
                print('Please select a genre from the list below or press 0 for other recommendations ')
                continue
        except ValueError:
            print('Please select a genre by id')
            continue

if __name__=="__main__":
    main()