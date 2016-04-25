module HatenaGroup
  module Calendar
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
