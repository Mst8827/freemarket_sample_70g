class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :user_family_name, :user_first_name, :user_family_name_kana, :user_first_name_kana,:birth, presence: true
  validates :email, uniqueness: true, format: { with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+\z/ }
  validates :user_family_name, :user_first_name, :user_family_name_kana, :user_first_name_kana, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/ }

  has_many :items, dependent: :destroy
  has_many :comments
  has_one :profile
  has_many :creditcards
  has_one :location
  has_many :sns_credentials
end
