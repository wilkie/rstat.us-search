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
  end
end

Propeller::AddonManager.register RstatUs::Search
