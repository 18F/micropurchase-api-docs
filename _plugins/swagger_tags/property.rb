module SwaggerTags
  class Property < Struct.new(:name, :hash)
    def to_liquid
      {
        'name' => name,
        'title' => title,
        'description' => description,
        'display_type' => display_type,
        'example' => example
      }
    end

    def title
      hash['title'] || name
    end

    def description
      hash['description']
    end

    def type
      if hash['type']
        hash['type'].dup
      else
        'object'
      end
    end

    def display_type
      type
    end

    def example
      ''
    end

    def self.factory(name, hash)
      return SwaggerTags::ReferenceProperty.new(name, hash) if hash['$ref']

      case hash['type']
      when ::Array
        SwaggerTags::AnyOfProperty.new(name, hash)
      when 'string'
        SwaggerTags::StringProperty.new(name, hash)
      when 'integer', 'number', 'boolean'
        SwaggerTags::NumberProperty.new(name, hash)
      when 'array'
        SwaggerTags::Array.new(name, hash)
      when 'object', nil
        SwaggerTags::Object.new(name, hash)
      else
        raise hash['type']
        fail "Unhandled property type: #{hash.inspect}"
      end
    end
  end
end
