require_relative 'object'

module SwaggerTags
  class AllOf < SwaggerTags::Object
    def initialize(name, hash, specification)
      super(name, hash)
      @specification = specification
    end
  end
end
