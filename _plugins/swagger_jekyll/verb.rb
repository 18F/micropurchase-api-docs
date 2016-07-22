module SwaggerJekyll
  class Verb
    attr_accessor :verb, :responses
    def initialize(verb, hash, specification)
      @verb = verb
      @hash = hash
      @specification = specification
    end

    def to_liquid
      @hash.dup.merge(
        'responses' => responses,
        'example_json?' => example_json?,
        'example_json' => example_json_excerpt)
    end

    def example_json?
      @hash.dig('responses', '200', 'examples', 'application/json')
    end

    def example_json_excerpt
      example = @hash.dig('responses', '200', 'examples', 'application/json')
      example.to_json
    end

    def responses
      responses_hash.values
    end

    private

    def responses_hash
      if @_responses_hash.nil?
        @_responses_hash = {}
        @hash['responses'].each do |code, response_hash|
          @_responses_hash[code] = Response.new(code, response_hash, @specification)
        end
      end

      @_responses_hash
    end
  end
end
