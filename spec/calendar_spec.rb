require 'spec_helper'

vcr_opts = { :cassette_name => 'calendar' }
describe HatenaGroup::Calendar, :vcr => vcr_opts do
  describe :day do
    context 'day(Date)' do
      context :update_content do
        before { day.body = input }
        it { expect(day.body).to include input }
      end
      let(:day) { calendar.day(Date.today) }
    end

    context 'day(String)' do
      context :update_content do
        before { day.body = input }
        it { expect(day.body).to include input }
        let(:input) { "this-is-test" }
      end
      let(:day) { calendar.day(Date.today.prev_month.strftime('%Y-%m-%d')) }
    end

    let(:input) { "this-is-test-#{Date.today}" }
  end

  include SpecHelper::HatenaEnv
  let(:calendar) { HatenaGroup::Calendar.new "for-travis-ci", hatena_user, hatena_password }
end
