

module Utility
  
  # Takes an array of hashes from the database and returns an array of objects      
  def results_as_objects
  
    array_of_objects = []
  
    results.each do |result_hash|
      array_of_objects << self.new(result_hash)
    end
    
    return array_of_objects
  end
  
end