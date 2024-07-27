# Data source:
- CSV file: https://insideairbnb.com/get-the-data/ (since it is quite large one, I converted some of them into parquet format)
- Data dictionary: https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit?gid=1322284596#gid=1322284596 

# Analysis question: 
- [1] what are the factors affecting the booking revenue of Airbnb listings in Bangkok? 
- [2] How Airbnb hosts in Bangkok can improve their revenue?

# Problem break down:

          Booking Revenue = Price per night * Occupancy rate (L12Ms) * Total availability (N12Ms)

## question paraphase: what are the factors affecting the 3 key metrics:
(1) price: facility, location, time 
(2) occupancy rate and availability factors: location, time, price, review related factors, host related factors

## Clean listing data
- [x] get rid of unnecessary columns
  
A- Price factors:
  - [x] facitlity: property_type, room_type, accomodates, bathrooms, bathrooms text, bedrooms, beds, amenities, price
  - [x] location: latitde, longitude, neighbourhood_cleanse,
  - [x] time: calendar factors
  
B- Occupancy rate: 
  - [x] location, time, price factors
  - [x] occupancy metrics: availability, minimum/ maximum night, 
  - [x] host factors: check host_location, convert host_since/ response time/ response rate/ acceptance rate/ superhost to suitable data types
  - [x] review related: keep all review column in listing, and count the number of review for each listing in review data

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
- [x] drop column0
- [x] convert date into datetime format

B - For calendar table:
- [x] drop column0
- [x] convert price into price_baht
- [x] convert date into datetime format
- [x] clean adjusted-price

C- Other:
- [x] Remove listings on calendar and reviews that has been deleted from listing table as identified as inactive listing

### Cleaning process
### Save clean files
