class Store 
   include MongoMapper::Document
  key :name,String
  key :retailer,String
  key :address, String
  # one :location
end