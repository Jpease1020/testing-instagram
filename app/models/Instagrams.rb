class Instagrams
  # attr_reader :response

  def initialize(response)
    @response = response
  end

  def all_grams
    @response
    response = parse(@response)
    response = build_object(response)
    response.data
  end


  private

    def build_object(data)
      OpenStruct.new(data)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end




  # def self.service(user)
  #   InstagramService.new(user)
  # end
  #
  # def self.most_recent_post(user)
  #   new(service(user).most_recent_post)
  # end
  #
  # def self.find_post(post_id)
  #   new(service(user).find_post(id))
  # end
