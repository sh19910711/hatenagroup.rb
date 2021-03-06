require 'mechanize'

module HatenaGroup
  module Calendar
    class Client
      attr_reader :agent
      attr_reader :group

      def initialize(group, hatena_user_id, hatena_password)
        @group = group
        @agent = ::Mechanize.new
        agent.log = ::Logger.new(STDERR)
        agent.log.level = ::Logger::INFO
        agent.user_agent = USER_AGENT
        login! hatena_user_id, hatena_password
      end

      def day(d)
        if d.instance_of?(Date)
          Keyword.new self, d.strftime("%Y-%m-%d")
        else
          Keyword.new self, d
        end
      end

      private
        def login!(hatena_user_id, hatena_password)
          agent.get(HATENA_LOGIN_URL).form_with(:action => '/login') do |form|
            form['name']       = hatena_user_id
            form['password']   = hatena_password
            form['persistent'] = 0
            form.submit
          end
        end
    end
  end
end
