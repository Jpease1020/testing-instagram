class Comment
  attr_reader :id, :text, :commenter, :commenter_id
  def initialize(id, text, commenter, commenter_id)
    @text         = text
    @id           = id
    @commenter    = commenter
    @commenter_id = commenter_id
  end

  def self.create(user, comment, gram_id)
    InstagramService.new(user).create_comment(comment, gram_id)
  end

  def self.destroy(user, media_id, comment_id)
    InstagramService.new(user).delete_comment(media_id, comment_id)
  end
end
