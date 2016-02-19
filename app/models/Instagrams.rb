class Instagrams
  # attr_reader :response         why is this not working?????????

  def initialize(response)
    @response = response
  end

  def images
    gram.images[:standard_resolution][:url]

  end

  def caption
    gram.caption[:text]

  end

  def likes
    gram.likes[:count]

  end

  def comments
    gram.comments[:comms].each do |comment| comment.text

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
