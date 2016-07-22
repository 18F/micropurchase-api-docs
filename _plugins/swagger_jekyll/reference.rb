require 'hana'

module SwaggerJekyll
  class Reference
    def initialize(name, hash, specification)
      @name = name
      @hash = hash
      @specification = specification

      fail "This isn't a reference: #{hash.inspect}" unless hash['$ref']

      @pointer = Hana::Pointer.new(hash['$ref'])
    end

    def to_liquid
      {
        'name' => name,
        'display_type' => display_type
      }
    end

    def name
      @name || ''
    end

    def dereference
      target = @pointer.eval(@specification.hash)
      Schema.factory(@name, target, specification)
    end

    def display_type
      "#{@hash['$ref'].gsub('#/definitions/', '')} object"
    end

    def example
      ''
    end
  end
end
