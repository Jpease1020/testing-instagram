class InstagramPost
  attr_reader :id, :text

  def initialize(post = {})
    @id = post[:id]
    @text = post[:text]
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
