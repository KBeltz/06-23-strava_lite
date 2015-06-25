# ---------------------------------------------------------------------
# bikes - menu
# ---------------------------------------------------------------------

# manage bikes menu
get "/bikes" do
  erb :"/bikes/manage_bikes"
end

# ---------------------------------------------------------------------
# create
# ---------------------------------------------------------------------

# form for user to enter information to add bike
get "/add_bike_form" do
  erb :"/bikes/add_bike_form"
end

# Gets parameters from add_bike_form.
#
# Adds bike to table
get "/add_bike" do
  if Bike.valid?(params["first_name"], params["last_name"])
    erb :"/bikes/add_bike_error"
  else 
    Bike.add_to_database("first_name" => params["first_name"], "last_name" => params["last_name"], "nickname" => params["nickname"])
    erb :"/bikes/success"
  end
end

# ---------------------------------------------------------------------
# read
# ---------------------------------------------------------------------

# Returns a list of all rows in the bikes table.
get "/view_bikes" do
  erb :"/bikes/view_bikes"
end

# form to enter bike id
get "/search_by_id_form" do
  erb :"/bikes/search_by_id_form"
end

# Returns user profile
get "/search_by_id/" do
  @new_bike = Bike.find(params["id"])
  erb :"/bikes/search_by_id"
end

# ---------------------------------------------------------------------
# update
# ---------------------------------------------------------------------

# table of bike profiles
get "/edit_bike_list" do
  erb :"/bikes/edit_bike_list"
end

# edit bikes form
get "/edit_bike_form/:x" do
  @new_bike = Bike.find(params["x"])
  erb :"/bikes/edit_bike_form"
end

# Gets parameters from edit_bike_form
#
# Updates the item in the appropriate table of the database
get "/edit_bike/" do
  @new_bike = Bike.find(params["x"])
  @new_bike.save
  
  erb :"/bikes/success"
end

# ---------------------------------------------------------------------
# delete
# ---------------------------------------------------------------------

get "/delete_bike" do
  erb :"/bikes/delete_bike"
end

get "/delete_bike/:x" do
  @specific_bike = Bike.find(params["x"])
  @specific_bike.delete_row
  
  erb :"/bikes/success"
end