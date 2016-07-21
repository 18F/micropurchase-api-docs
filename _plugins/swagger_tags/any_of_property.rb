require_relative 'property'

module SwaggerTags
  class AnyOfProperty < SwaggerTags::Property
    def display_type
      type.join(", ")
    end
  end
end
