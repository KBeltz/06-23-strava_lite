# ---------------------------------------------------------------------
# cyclists - menu
# ---------------------------------------------------------------------

# manage cyclists menu
get "/cyclists" do
  erb :"/cyclists/manage_cyclists"
end

# ---------------------------------------------------------------------
# create
# ---------------------------------------------------------------------

# form for user to enter information to add cyclist
get "/add_cyclist_form" do
  erb :"/cyclists/add_cyclist_form"
end

# Gets parameters from add_cyclist_form.
#
# Adds cyclist to table
get "/add_cyclist" do
  if Cyclist.valid?(params["first_name"], params["last_name"])
    erb :"/cyclists/add_cyclist_error"
  else 
    Cyclist.add_to_database("first_name" => params["first_name"], "last_name" => params["last_name"], "nickname" => params["nickname"])
    erb :"/cyclists/success"
  end
end

# ---------------------------------------------------------------------
# read
# ---------------------------------------------------------------------

# Returns a list of all rows in the cyclists table.
get "/view_cyclists" do
  erb :"/cyclists/view_cyclists"
end

# form to enter cyclist id
get "/search_by_id_form" do
  erb :"/cyclists/search_by_id_form"
end

# Returns user profile
get "/search_by_id/:x" do
  erb :"/cyclists/search_by_id"
end

# ---------------------------------------------------------------------
# update
# ---------------------------------------------------------------------

# table of cyclist profiles
get "/edit_cyclist_list" do
  erb :"/cyclists/edit_cyclist_list"
end

# edit cyclists form
get "/edit_cyclist_form/:x" do
  @new_cyclist = Cyclist.find(params["x"])
  erb :"/cyclists/edit_cyclist_form"
end

# Gets parameters from edit_cyclist_form
#
# Updates the item in the appropriate table of the database
get "/edit_cyclist/" do
  @new_cyclist = Cyclist.find(params["x"])
  @new_cyclist.save
  
  erb :"/cyclists/success"
end

# ---------------------------------------------------------------------
# delete
# ---------------------------------------------------------------------

get "/delete_cyclist" do
  erb :"/cyclists/delete_cyclist"
end

get "/delete_cyclist/:x" do
  @specific_cyclist = Cyclist.find(params["x"])
  @specific_cyclist.delete_row
  
  erb :"/cyclists/success"
end
