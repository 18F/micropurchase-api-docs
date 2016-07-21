module SwaggerTags
  class Response < Struct.new(:code, :hash)
    def description
      hash['description']
    end

    def to_liquid
      hash.dup.merge(
        'code' => code,
        'display_type' => response_type.display_type
      )
    end

    def display_type
      response_type.display_type
    end

    def response_type
      SwaggerTags::Property.factory('FOO', hash['schema'])
    end
  end
end
