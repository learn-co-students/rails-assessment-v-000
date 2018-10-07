class User < ApplicationRecord
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :password_digest, :presence => true
  validates :password_digest, :uniqueness => true
  has_secure_password
  
  has_many :user_posts
  has_many :posts, through: :user_posts
  
   def self.from_omniauth(auth)
        user = find_or_create_by(uid: auth.uid, provider: auth.provider)
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.save!
        user
    end
end
