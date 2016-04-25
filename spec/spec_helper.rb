require 'hatenagroup'
require 'vcr'

module SpecHelper
  module HatenaEnv
    def method_missing(method, *args)
      if method.match(/^hatena_/)
        env = method.to_s.upcase
        raise "$#{env} is not set" if ENV[env].nil?
        ENV[env]
      else
        super
      end
    end
  end
end

VCR.configure do |conf|
  conf.cassette_library_dir = 'spec/fixtures/vcr'
  conf.configure_rspec_metadata!
  conf.hook_into :webmock
  conf.default_cassette_options = {
    :record => :new_episodes,
    :serialize_with => :psych,
    :re_record_interval => 24 * 3600,
    :match_requests_on => %i{ method uri body }
  }
end
