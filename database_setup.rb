# Load/create our database for this program.
DATABASE = SQLite3::Database.new("commuters.db")

# Make the tables.
DATABASE.execute("CREATE TABLE IF NOT EXISTS cyclists (id INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, nickname TEXT);")

DATABASE.execute("CREATE TABLE IF NOT EXISTS bikes (id INTEGER PRIMARY KEY, cyclist_id INTEGER NOT NULL, bike_name TEXT, description TEXT);")

DATABASE.execute("CREATE TABLE IF NOT EXISTS rides (id INTEGER PRIMARY KEY, cyclist_id INTEGER NOT NULL, bike_id INTEGER NOT NULL, ride_name TEXT, miles DECIMAL (5,2) NOT NULL, period DATETIME DEFAULT CURRENT_TIMESTAMP);")

# Get results as an Array of Hashes.
DATABASE.results_as_hash = true