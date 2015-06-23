# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("strava_lite.db")

# Make the tables.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS cyclists (id INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, nickname TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS bikes (id INTEGER PRIMARY KEY, FOREIGN KEY(cyclist_id) REFERENCES cyclists(id) NOT NULL, bike_name TEXT, description TEXT);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS rides (id INTEGER PRIMARY KEY, FOREIGN KEY(cyclist_id) REFERENCES cyclists(id) NOT NULL, FOREIGN KEY(bike_id) REFERENCES bikes(id) NOT NULL, ride_name TEXT, miles, DECIMAL(5,2) NOT NULL, datetime CURRENT_TIMESTAMP NOT NULL);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true