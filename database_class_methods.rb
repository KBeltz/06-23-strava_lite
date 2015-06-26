require "active_support"
require "active_support/inflector"
 
 
# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.
 
module DatabaseClassMethods
  
  table_name = self.to_s.pluralize.underscore
  # Get all of the rows for a table.
  #
  # Returns an Array containing Hashes for each row.
  def all
    # Figure out the table's name from the class we're calling the method on.
    # table_name = self.to_s.pluralize.underscore
    
    results = DATABASE.execute("SELECT * FROM #{table_name}")
 
    results_as_objects = []
    
    results.each do |result_hash|
      results_as_objects << self.new(result_hash)
    end
    
    return results_as_objects
  end
  
  # find - Use this method to find a 
  # product based on the ID in database.
  #
  # record_id- The Integer ID of the row to return.
  #
  #
  #    # Here, I'm using the `find` method from DatabaseClassMethods.
  #    result = Product.find(product_id).first
  #    # {"id" => 1, "name" => "Sumeet", "age" => 500}
  #
  #    
  #  
  # makes new instance of row
  #
  # Returns an object 
  def find(record_id)
    # Figure out the table's name from the class we're calling the method on.
    # table_name = self.to_s.pluralize.underscore
    
    result = DATABASE.execute("SELECT * FROM #{table_name} WHERE id = #{record_id}").first
     
    self.new(result)
  end
 
  # Add a new record to the database.
  #
  # Returns an Object.
  def add_to_database(options={})
    # Example: {"name" => "Sumeet", "age" => 500}
    
    column_names = options.keys
    values = options.values
    
    column_names_for_sql = column_names.join(", ")
    
    individual_values_for_sql = []
    
    values.each do |value|
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else  
        individual_values_for_sql << value
      end  
    end
    
    values_for_sql = individual_values_for_sql.join(", ")
    
    # Alternative:
    # values.to_s.delete("\[\]")
    # table_name = self.to_s.pluralize.underscore
    
    DATABASE.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")
 
    id = DATABASE.last_insert_row_id
    options["id"] = id
 
    self.new(options)
  end
end