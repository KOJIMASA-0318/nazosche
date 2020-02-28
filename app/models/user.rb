class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i

  validates :name, presence: true, uniqueness: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 4 }
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  has_many :events
end
