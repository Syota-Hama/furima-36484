class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'First name is invalid. Input full-width characters' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name is invalid. Input full-width characters' }
    validates :first_name_hurigana,
              format: { with: /\A[ァ-ヶー]+\z/, message: 'First name kana is invalid. Input full-width katakana characters' }
    validates :family_name_hurigana,
              format: { with: /\A[ァ-ヶー]+\z/, message: 'Last name kana is invalid. Input full-width katakana characters' }
    validates :birthday
  end

  has_many :goods
  has_many :users
end
