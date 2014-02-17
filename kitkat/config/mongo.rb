require 'mongo'
include Mongo

mongo_uri = ENV['MONGOLAB_URI']
db_name = mongo_uri[%r{/([^/\?]+)(\?|$)}, 1]
client = MongoClient.from_uri(mongo_uri)
db = client.db(db_name)