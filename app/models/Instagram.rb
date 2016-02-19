class Instagram
  attr_reader :image_url, :caption, :likes_count, :id, :comments

  def initialize(image_url, caption, likes_count, id, comments)
    @image_url   = image_url
    @caption     = caption
    @likes_count = likes_count
    @comments    = comments
    @id          = id
  end

  def self.all(user)
    grams = InstagramService.new(user).all_grams
    grams = grams.map do |gram|
      new(gram[:images][:standard_resolution][:url],
          gram[:caption][:text],
          gram[:likes][:count],
          gram[:id],
          Instagram.get_comments(user, gram[:id])
          )
    end
    grams
  end

  def self.get_comments(user, id)
    comments = InstagramService.new(user).comments(id)
    comments.map do |comment|
      Comment.new(comment[:id],
                  comment[:text],
                  comment[:from][:username],
                  comment[:from][:id])
    end
  end

end
