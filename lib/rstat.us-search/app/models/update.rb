class Update
  include Tire::Model::Search
  include Tire::Model::Callbacks
  index_name RstatUs::Search.index_name

  # Will override the def self.search (hopefully)
end
