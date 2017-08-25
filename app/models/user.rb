class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_one :cart # , dependent: :destroy
  has_one :user_info # , dependent: :destroy
  has_many :orders # TODO: what to do with orders when we delete user?
  has_many :reviews # , dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true

  validate :password_validation

  rails_admin do
    object_label_method :email
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      full_name = auth.info.name.split(' ')
      user.first_name = full_name[0]
      user.last_name = full_name[1]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email.split('@').first
    end
  end

  private

  def password_validation
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/)
      errors.add :password, 'must have at least 8 characters length, include at least one lowercase letter, one uppercase letter, and one digit'
    end
  end
end
