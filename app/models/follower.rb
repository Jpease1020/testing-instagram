class Follower
  attr_reader :user_name, :profile_picture, :id
  def initialize(user_name, profile_picture, id)
    @user_name = user_name
    @profile_picture = profile_picture
    @id = id
  end

  def self.all(user)
    followers = InstagramService.new(user).followers.data
    followers.map do |follower|
      new(follower[:username],
          follower[:profile_picture],
          follower[:id]
         )
    end
  end
end
