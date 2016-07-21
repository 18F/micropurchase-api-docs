module SwaggerTags
  class Object < Struct.new(:name, :hash)
    def to_liquid
      {
        'name' => name,
        'display_type' => display_type,
        'title' => title,
        'description' => description,
        'example' => example,
        'properties' => properties
      }
    end

    def type
      'object'
    end

    def properties
      properties_hash.values
    end

    def display_type
      if properties.length < 3
        '{' + properties.map {|p| '"' + p.name + '": ' + p.display_type}.join(', ') + '}'
      else
        "<#{name} object>"
      end
    end

    def title
      name
    end

    def description
      hash['description']
    end

    def example
      ''
    end

    def properties_hash
      if @_properties.nil?
        @_properties = {}

        if hash.key?('properties')
          hash['properties'].each do |name, value|
            @_properties[name] = SwaggerTags::Property.factory(name, value)
          end
        end
      end

      @_properties
    end

    def self.factory(name, hash, specification)
#      if hash['allOf']
#        SwaggerTags::AllOf.new(name, hash, specification)
#      else
        SwaggerTags::Object.new(name, hash)
#      end
    end
  end
end
