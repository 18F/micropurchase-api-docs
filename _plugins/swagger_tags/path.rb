module SwaggerTags
  class Path
    attr_accessor :path, :verbs

    def initialize(path, hash)
      @path = path
      @hash = hash
    end

    def to_liquid
      @hash.dup.merge(
        'path' => @path,
        'verbs' => verbs
      )
    end

    def verbs
      verbs_hash.values
    end

    private

    def verbs_hash
      if @_verbs_hash.nil?
        @_verbs_hash = {}
        @hash.each do |path, hash|
          @_verbs_hash[path] =SwaggerTags::Verb.new(path, hash)
        end
      end

      @_verbs_hash
    end
  end
end
