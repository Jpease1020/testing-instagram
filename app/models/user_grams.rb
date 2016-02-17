class UserGrams

  def self.service
    InstagramService.new
  end

  def self.most_recent_post(user)
    service.most_recent_post(user)
  end
  
end
