require "active_support"
require "active_support/inflector"

module Utility
  
  # takes the class name and returns the name of the correspondng table
  # def get_table_name
  #   return self.to_s.pluralize.underscore
  # end
  
  # Takes an array of hashes from the database and returns an array of objects  
  def results_as_objects(database_results)
  
    array_of_objects = []
  
    database_results.each do |result_hash|
      array_of_objects << self.new(result_hash)
    end
    
    return array_of_objects
  end
  
end