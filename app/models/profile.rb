class Profile
  include Mongoid::Document
  include Elasticsearch::Model
  
  store_in collection: "users"
  index_name "sidekiq-test-users"
  
  def as_indexed_json(options={})
    self.as_json
  end  
  
end