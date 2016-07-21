module SwaggerTags
  class Array < SwaggerTags::Property
    def display_type
      "array of #{object_type} objects"
    end

    # Need a more elegant way for this
    def object_type
      if hash['items']['type']
        hash['items']['type']
      else
        hash['items']['$ref'].gsub('#/definitions/', '')
      end
    end
  end
end
