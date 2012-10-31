require 'propeller'

module RstatUs
  module Search
    def self.index_name
      @@index_name
    end

    def self.init
      if ENV['BONSAI_INDEX_URL']
        Tire.configure do
          url "http://index.bonsai.io"
        end
        @@index_name = ENV['BONSAI_INDEX_URL'][/[^\/]+$/]
      else
        app_name = Rails.application.class.parent_name.underscore.dasherize
        app_env = Rails.env
        @@index_name = "#{app_name}-#{app_env}"
      end

      require 'rstat.us-search/app/models/update'
    end

    def self.test_initialize
      class << self
        class ::Update
          # This makes the document searchable immediately but affects
          # performance in production.
          after_save lambda { tire.index.refresh }
        end
      end
    end

    def self.test_setup
    end

    def self.test_teardown
      Tire::Index.new(@@index_name).delete
    end
  end
end

Propeller::AddonManager.register :"rstat.us-search", RstatUs::Search
