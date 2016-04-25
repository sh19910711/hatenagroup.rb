require 'mechanize'
require 'hatenagroup/calendar/klazz'
require 'hatenagroup/calendar/keyword'

module HatenaGroup
  module Calendar
    def self.new(*args)
      Klazz.new *args
    end
  end
end
