require 'mechanize'

module HatenaGroup
  class Calendar
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
      attr_reader :agent
      attr_reader :group

      USER_AGENT = 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'
      HATENA_LOGIN_URL = 'https://www.hatena.ne.jp/login'

      def login!(hatena_user_id, hatena_password)
        agent.get(HATENA_LOGIN_URL).form_with(:action => '/login') do |form|
          form['name']       = hatena_user_id
          form['password']   = hatena_password
          form['persistent'] = 0
          form.submit
        end
      end

      def keyword(s)
        Keyword.new agent, group, s
      end

      class Keyword
        def initialize(agent, group, keyword)
          @agent = agent
          @group = group
          @keyword = keyword
        end

        def body
          agent.get(read_url).form_with(:name => 'edit', :action => '/keyword').field_with(:name => 'body').value
        end

        def body=(s)
          agent.get(edit_url).form_with(:name => 'edit', :action => '/keyword') do |form|
            next unless form
            form['body'] = s
            form.submit
          end
        end

        private
          attr_reader :agent
          attr_reader :keyword
          attr_reader :group

          def read_url
            "http://#{group}.g.hatena.ne.jp/keyword/#{keyword}?mode=edit&#{Time.now.to_i}"
          end

          def edit_url
            "http://#{group}.g.hatena.ne.jp/keyword/#{keyword}?mode=edit"
          end
      end
  end
end
