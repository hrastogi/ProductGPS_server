class Location  
   include MongoMapper::Document
  key :lon,String
  key :lat,String
  # belongs_to :item
end