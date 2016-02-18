class Instagrams
  # attr_reader :response

  def initialize(response)
    @response = response
  end

  def all_grams
    build_object(parse(@response)).data
  end

  def comments
    build_object(parse(@response)).data
  end


  private

    def build_object(data)
      OpenStruct.new(data)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
