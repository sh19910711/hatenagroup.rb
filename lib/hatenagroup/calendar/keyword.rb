module HatenaGroup
  module Calendar
    class Keyword
      def initialize(client, keyword)
        @client = client
        @keyword = keyword
      end

      def body
        client.agent.get(read_url).form_with(:name => 'edit', :action => '/keyword').field_with(:name => 'body').value
      end

      def body=(s)
        client.agent.get(edit_url).form_with(:name => 'edit', :action => '/keyword') do |form|
          next unless form
          form['body'] = s
          form.submit
        end
      end

      private
        attr_reader :client
        attr_reader :keyword

        def read_url
          "http://#{client.group}.g.hatena.ne.jp/keyword/#{keyword}?mode=edit&#{::Time.now.to_i}"
        end

        def edit_url
          "http://#{client.group}.g.hatena.ne.jp/keyword/#{keyword}?mode=edit"
        end
    end
  end
end
