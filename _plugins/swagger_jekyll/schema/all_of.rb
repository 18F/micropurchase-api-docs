require_relative '../schema'

module SwaggerJekyll
  class Schema::AllOf < Schema
    def initialize(name, hash, specification)
      super(name, hash)
      @specification = specification
    end
  end
end
