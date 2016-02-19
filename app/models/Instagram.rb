class Instagram
  attr_reader :image_url, :caption, :likes_count, :comments

  def initialize(image_url, caption = nil, likes_count = nil, comments = nil)
    @image_url = image_url
    @caption = caption
    @likes_count = likes_count
    @comments = comments
  end

  def self.all(user)
    grams = InstagramService.new(user).all_grams
    grams = grams.map do |gram|
      new(gram[:images][:standard_resolution][:url],
          gram[:caption][:text],
          gram[:likes][:count],
          Instagram.get_comments(user, gram[:id])
          )
    end
    grams
  end

  def self.get_comments(user, id)
    comments = InstagramService.new(user).comments(id)
  end

  private

    def build_object(data)
      OpenStruct.new(data)
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
