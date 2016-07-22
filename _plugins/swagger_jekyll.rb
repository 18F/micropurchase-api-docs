require 'json'
require 'open-uri'

Dir[File.join(File.dirname(__FILE__), 'swagger_jekyll')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'swagger_jekyll', 'schema')].each {|file| require file }

# take from 18F/Jekyll_get
module SwaggerJekyll
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      config = site.config['swagger']
      if config.nil?
        return
      end
      if !config.is_a?(Array)
        config = [config]
      end
      config.each do |d|
        begin
          data_key = d['id'] || 'swagger'
          source = JSON.load(open(d['json']))
          site.data[data_key] = Specification.new(source)

          raise site.data.inspect

          if d['cache']
            data_source = (site.config['data_source'] || '_data')
            path = "#{data_source}/#{d['data']}.json"
            open(path, 'wb') do |file|
              file << JSON.generate(site.data[d['data']])
            end
          end
        rescue
          next
        end
      end
    end
  end
end

  #   class SwaggerTag < Liquid::Tag
#     def initialize(tag_name, text, tokens)
#       super
#       @tag_name = tag_name
#       @text = text
#     end

#     def render(context)
# 	    if /load from file (.+)/.match(@text)
#         context['swagger'] = SwaggerTags::Specification.new(JSON(page_relative_file_contents(context, $1.strip)))
# 		    return ''
#       elsif /load from url (.+)/.match(@text)
#         base_url = $1.strip
#     		resp = Net::HTTP.get_response(URI.parse(base_url))
#     		data = resp.body
#     		context['swagger'] = SwaggerTags::Specification.new(JSON(data))
#     		return ''
#       end
#     end
#   end
# end

# Liquid::Template.register_tag('swagger', SwaggerTags::SwaggerTag)
