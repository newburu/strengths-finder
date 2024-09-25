class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter google_oauth2]
  validates :uid, uniqueness: { scope: :provider }

  # ロール
  enum role: { normal: 0, admin: 1 }

  has_many :user_strengths, -> {order(:no)}, dependent: :destroy
  accepts_nested_attributes_for :user_strengths, allow_destroy: true
  has_many :strengths, through: :user_strengths

  has_many :created_articles, foreign_key: 'creator_id', class_name: 'Article'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.code = auth.info.nickname
      user.email = auth.info.email || User.dumy_email(auth)
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.image = auth.info.image
      user.save!
    end
  end

  private
    def self.dumy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
end
