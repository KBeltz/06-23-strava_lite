require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Bike
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  

  attr_accessor :id, :cyclist_id, :bike_name, :description

  # Initializes a new Bike object
  #
  # id            - Integer id primary key created in the 'bikes' table
  # cyclist_id    - Integer containing the id of the cyclist who owns the bike
  # bike_name     - String containing the make/model/name of the bike
  # description   - (optional) String containing a description of the bike
  #
  # Returns a Bike object
  
  def initialize(options = {})
    
    # Example: {"id" => 1, "cyclist_id" => "3", "bike_name" => "Giant Revel I", "description" => "Matte grey MTB"}
    @id = options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @nickname = options["nickname"]
 
  end
  
  # method to validate cyclist profiles before they are added to the database
  #
  # name1 - String containing the first name of the cyclist being added
  # name2 - String containing the last name of the cyclist being added
  #
  # Returns boolean
  def self.valid?(name1, name2)
    if name1.empty? || name2.empty?
      true
    else
      false
    end
  end
end