class Indexer
  include Sidekiq::Worker
  sidekiq_options retry: false

  client = Elasticsearch::Client.new host: 'localhost:9200'

  def perform(record_id)
    logger.debug ["indexing - ID: #{record_id}"]
    record = Profile.find(record_id)
    record.__elasticsearch__.index_document
  end
end