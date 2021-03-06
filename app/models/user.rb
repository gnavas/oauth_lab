class User < ActiveRecord::Base
  def self.from_omniauth(auth, provider) 
    where(provider: auth[:provider], uid: auth[:uid], name: auth[:info][:nickname]).first || create_from_omniauth(auth,provider)
  end
    
 def self.create_from_omniauth(auth,provider)
if provider == "twitter"
 create(provider: auth["provider"], uid: auth["uid"], name: auth["info"]["nickname"])
else
  create(provider: auth["provider"], uid: auth["uid"], name: auth["info"]["first_name"])
end
end
end



