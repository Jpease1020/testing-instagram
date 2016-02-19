class Comment
  def initialize
  end

  def create_comment(user, comment, gram_id)
    InstagramService.new(user).create_comment(comment, gram_id)
  end
end
