require 'json'

Dir[File.join(File.dirname(__FILE__), 'swagger')].each {|file| require file }

module SwaggerTags
  class SwaggerTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @tag_name = tag_name
      @text = text
    end

    def render(context)
	    if /load from file (.+)/.match(@text)
        context['swagger'] = SwaggerTags::Specification.new(JSON(page_relative_file_contents(context, $1.strip)))
		    return ''
      elsif /load from url (.+)/.match(@text)
        base_url = $1.strip
    		resp = Net::HTTP.get_response(URI.parse(base_url))
    		data = resp.body
    		context['swagger'] = SwaggerTags::Specification.new(JSON(data))
    		return ''
      end
    end
  end
end

Liquid::Template.register_tag('swagger', SwaggerTags::SwaggerTag)
