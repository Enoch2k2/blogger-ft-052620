class User < ApplicationRecord
  has_many :blogs

  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.find_or_create_from_omniauth(user_info)
    User.first_or_create(uid: user_info["uid"]) do |user|
      user.email = user_info["info"]["nickname"] + "@something.com"
      user.password = SecureRandom.hex
    end
  end
end
