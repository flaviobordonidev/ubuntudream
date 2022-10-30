class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  #enum role: [:user, :admin, :moderator, :author]
  enum role: {user: 0, admin: 1, moderator:2, author:3}

  ## ActiveStorage
  has_one_attached :avatar_image

  ## Validation
  validates :username, presence: true
end
