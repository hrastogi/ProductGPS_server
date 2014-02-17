class Sku
  include MongoMapper::Document
  include Tire::Model::Search
  include Tire::Model::Callbacks

   key :name, String
   key :description,String
   key :img_url,String
   key :size,Array
   key :color, Array
   key :gender, String

   # many :stores, :in => :store_ids
   many :locations, :in => :location_ids
   mapping do
       indexes :_id, index: :not_analyzed
       indexes :description, analyzer: 'snowball', boost: 100
       indexes :location, type: 'geo_point'
   end
  
   def lat_lon
       [latitude, longitude].join(',')
   end
    
   def to_indexed_json
       self.to_json
     end
 end