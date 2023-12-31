class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.from_omniauth(auth)
  name_split = auth.info.name.split(" ")
  logger.debug auth.info.image
  user = User.where(email: auth.info.email).first
  user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], 
    email: auth.info.email, password: Devise.friendly_token[0, 20], avatar_url: auth.info.image)
    user
end
# def self.from_omniauth(auth)
#     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#       user.email = auth.info.email
#       user.password = Devise.friendly_token[0, 20]
#       #user.full_name = auth.info.name # assuming the user model has a name
#       #user.avatar_url = auth.info.image # assuming the user model has an image
#       # If you are using confirmable and the provider(s) you use validate emails,
#       # uncomment the line below to skip the confirmation emails.
#       # user.skip_confirmation!
#     end
#   end
end
