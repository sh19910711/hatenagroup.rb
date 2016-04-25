require 'mechanize'
require 'hatenagroup/calendar/klazz'
require 'hatenagroup/calendar/keyword'

module HatenaGroup
  module Calendar
    def self.new(*args)
      Klazz.new *args
    end

    USER_AGENT = 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'
    HATENA_LOGIN_URL = 'https://www.hatena.ne.jp/login'
  end
end
