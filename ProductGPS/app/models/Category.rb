class Category
  include MongoMapper::Document
  include Tire::Model::Search
  include Tire::Model::Callbacks
    
  key :name,String
 
end