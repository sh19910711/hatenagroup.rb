module HatenaGroup
  module Calendar
    class Klazz
      attr_reader :agent
      attr_reader :group

      def initialize(group, hatena_user_id, hatena_password)
        @group = group
        @agent = Mechanize.new
        agent.log = Logger.new(STDERR)
        agent.log.level = Logger::INFO
        agent.user_agent = USER_AGENT
        login! hatena_user_id, hatena_password
      end

      def day(d)
        keyword d.strftime("%Y-%m-%d")
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

        def keyword(s)
          Keyword.new self, s
        end
    end
  end
end
