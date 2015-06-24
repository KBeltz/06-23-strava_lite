require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Cyclist
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  

  attr_accessor :id, :first_name, :last_name, :nickname

  # Initializes a new Cyclist object
  #
  # id         - Integer id primary key created in the 'cyclists' table
  # first_name - String containing the first name of the cyclist
  # last_name  - String containing the last name of the cyclist
  # nickname   - (optional) String containing the nickname of the cyclist
  #
  # Returns a Cyclist object
  
  def initialize(options = {})
    
    # Example: {"id" => 1, "first_name" => "Johnny", "last_name" => "Doe", "nickname" => "JohnBikes"}
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
  def self.valid?(options={})
    if options.empty?
      true
    else
      false
    end
  end
end
