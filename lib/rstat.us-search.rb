require 'propeller'

module RstatUs
  module Search
  end
end

class Update
  include Tire::Model::Search
  include Tire::Model::Callbacks
  index_name ELASTICSEARCH_INDEX_NAME

  # Will override the def self.search
end

Propeller::AddonManager.register RstatUs::Search
