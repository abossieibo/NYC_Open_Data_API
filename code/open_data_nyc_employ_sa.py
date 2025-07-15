from sodapy import Socrata
import pandas as pd


#Note that this is anonymous access, other APIs have tokens and login info
#Socrata can accomodate tokens and login

# Connect to the Socrata Open Data API
client = Socrata("data.cityofnewyork.us", None) #HUMAN INPUT, but You should not have to change this for Open Data pulls


# Dataset identifier 
dataset_id = "5hjv-bjbv" #HUMAN INPUT (after /resources/ in Open Data link)

# Initialize variables
limit = 50000  # package documentation says its possible to set this to blank
offset = 0
all_results = []

while True:
    # Fetch a chunk of data
    results = client.get(dataset_id, limit=limit, offset=offset)
    
    # Break the loop if no more data is returned
    if not results:
        break

    all_results.extend(results)
    offset += limit

# Convert to DataFrame
df = pd.DataFrame.from_records(all_results)

# Save to CSV
df.to_csv("../output/open_data_nyc_employ_DL_6-26-25.csv", index=False) #HUMAN CHOICE

# Close the client connection
client.close()
