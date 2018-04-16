class User < ApplicationRecord
has_many :guides
has_many :games, through: :guides
has_secure_password
validates :user_name, presence: true
validates :user_name, uniqueness: true
validates :password, presence: true


def self.find_or_create_by_omniauth(auth_hash)
  oauth_name = auth_hash["info"]["nickname"]
  if user = User.find_by(:user_name => oauth_name)
    return user
  else
    user = User.create(:user_name => oauth_name, :password => SecureRandom.hex)
    return user
  end
end


end
