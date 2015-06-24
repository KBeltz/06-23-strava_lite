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
end
