module SwaggerTags
  class ReferenceProperty < SwaggerTags::Property
    def display_type
      "#{hash['$ref'].gsub('#/definitions/', '')} object"
    end

    def example
      ''
    end
  end
end
