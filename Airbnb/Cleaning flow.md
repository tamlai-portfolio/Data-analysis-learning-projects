# Data source:
- CSV file: https://insideairbnb.com/get-the-data/ (since it is quite large one, I converted some of them into parquet format)
- Data dictionary: https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit?gid=1322284596#gid=1322284596 

# Analysis question: 
- [1] what are the factors affecting the booking revenue of Airbnb listings in Bangkok? 
- [2] How Airbnb hosts in Bangkok can improve their revenue?

# Problem break down:

          Booking Revenue = Price per night * Occupancy rate (L12Ms) * Total availability (N12Ms)

## Question paraphase: what are the factors affecting those key metrics:
(1) price: facility, location, time 
(2) occupancy rate and (3) availability factors: location, time, price, review related factors, host related factors

## Clean listing data
- [x] Get rid of unnecessary columns
  
A- Price factors:
  - [x] Facitlity: property_type, room_type, accomodates, bathrooms, bathrooms text, bedrooms, beds, amenities, price
  - [x] Location: latitde, longitude, neighbourhood_cleanse,
  - [x] Time: calendar factors
  
B- Occupancy rate: 
  - [x] Location, time, price factors
  - [x] Occupancy metrics: availability, minimum/ maximum night, 
  - [x] Host factors: check host_location, convert host_since/ response time/ response rate/ acceptance rate/ superhost to suitable data types
  - [x] Review related: keep all review column in listing, and count the number of review for each listing in review data

C- Other:
  - [x] Outliers check
  - [x] Handle null values

### Clean data related to price factors
### Clean location/host/review factors
### Handle missing values/ outliers
### Save clean file


## Clean calendar and reviews data
### Setting requirements
A - For review table:
- [x] Drop column0
- [x] Convert date into datetime format

B - For calendar table:
- [x] Drop column0
- [x] Convert price into price_baht
- [x] Convert date into datetime format
- [x] Clean adjusted-price

C- Other:
- [x] Remove listings on calendar and reviews that has been deleted from listing table as identified as inactive listing

### Cleaning process
### Save clean files
