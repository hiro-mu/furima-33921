class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kanji_name, presence: true
  validates :kanji_lastname, presence: true
  validates :kana_name, presence: true
  validates :kana_lastname, presence: true
  validates :birthday, presence: true
  
end
