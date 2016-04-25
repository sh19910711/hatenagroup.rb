require 'spec_helper'

vcr_opts = { :cassette_name => 'calendar' }
describe HatenaGroup::Calendar, :vcr => vcr_opts do
  describe :day do
    context :update_content do
      before { day.body = input }
      it { expect(day.body).to include input }
      let(:input) { "this-is-test" }
    end
    let(:day) { calendar.day(Date.new(2016, 4, 1)) }
  end

  include SpecHelper::HatenaEnv
  let(:calendar) { HatenaGroup::Calendar.new "for-travis-ci", hatena_user, hatena_password }
end
