require 'hatenagroup/calendar'
require 'vcr'

module SpecHelper
  module HatenaEnv
    def hatena_user
      raise "$HATENA_USER is not set" if ENV['HATENA_USER'].nil?
      ENV['HATENA_USER']
    end

    def hatena_password
      raise "$HATENA_PASSWORD is not set" if ENV['HATENA_PASSWORD'].nil?
      ENV['HATENA_PASSWORD']
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
  }
end
