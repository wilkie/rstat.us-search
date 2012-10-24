require 'propeller'

module RstatUs
  module Search
    def self.init
      if ENV['BONSAI_INDEX_URL']
        Tire.configure do
          url "http://index.bonsai.io"
        end
        ELASTICSEARCH_INDEX_NAME = ENV['BONSAI_INDEX_URL'][/[^\/]+$/]
      else
        app_name = Rails.application.class.parent_name.underscore.dasherize
        app_env = Rails.env
        ELASTICSEARCH_INDEX_NAME = "#{app_name}-#{app_env}"
      end
    end
  end
end

class Update
  include Tire::Model::Search
  include Tire::Model::Callbacks
  index_name ELASTICSEARCH_INDEX_NAME

  # Will override the def self.search (hopefully)
end

Propeller::AddonManager.register RstatUs::Search
