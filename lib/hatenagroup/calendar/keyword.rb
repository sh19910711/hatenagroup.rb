module HatenaGroup
  module Calendar
    class Keyword
      def initialize(client, keyword)
        @client = client
        @keyword = keyword
      end

      def body
        edit_form.field_with(:name => 'body').value
      end

      def body=(s)
        edit_form do |form|
          form['body'] = s
          form.submit
        end
      end

      private
        attr_reader :client
        attr_reader :keyword

        def edit_form(&b)
          url = "http://#{client.group}.g.hatena.ne.jp/keyword/#{keyword}?mode=edit"
          client.agent.get(url).form_with(:action => '/keyword', &b)
        end
    end
  end
end
