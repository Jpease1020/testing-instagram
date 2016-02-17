class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = User.find_or_create_by(provider: auth['omniauth.auth'][:provider], uid: auth['omniauth.auth'][:uid])

    user.email         = auth['omniauth.auth']['info']['email']
    user.name          = auth['omniauth.auth']['info']['name']
    user.username      = auth['omniauth.auth']['info']['nickname']
    user.image_url     = auth['omniauth.auth']['info']['image']
    user.bio           = auth['omniauth.auth']['info']['bio']
    user.token         = auth['omniauth.auth']['credentials']['token']
    user.save
    user
  end
end
