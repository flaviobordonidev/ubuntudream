class User < ApplicationRecord
  # column_names and others (ActiveStorage, ActionText, Mobility, ...) 
  # in alphabetical order except: "id" always on top; "created_at" and "updated_at" always on bottom.
  # "id"
  # "avatar_image" (ActiveStorage)
  # "bio" (Mobility)
  # "email"
  # "encrypted_password"
  # "first_name"
  # "language"
  # "last_name"
  # "location"
  # "phone_number"
  # "remember_created_at"
  # "reset_password_token"
  # "reset_password_sent_at"
  # "role"
  # "username"
  # "created_at"
  # "updated_at"

  # == Constants ============================================================
  
  # == Extensions ===========================================================

  ## devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  ## i18n dynamic
  extend Mobility
  translates :bio, type: :string
  
  # == Attributes ===========================================================

  ## enum
  #enum role: [:user, :admin, :moderator, :author]
  enum role: {user: 0, admin: 1, moderator:2, author:3}
  #enum language: [:it, :en, :pt]
  enum language: {it: 0, en: 1, pt: 2}

  ## ActiveStorage
  has_one_attached :avatar_image

  # == Relationships ========================================================

  ## association one-to-many
  has_many :eg_posts
  has_many :answers

  # == Validations ==========================================================

  ## Validation
  validates :username, presence: true

  # == Scopes ===============================================================

  #scope :search, -> (query) {where("first_name ILIKE ? OR last_name ILIKE ? OR username ILIKE ?", "%#{query.strip}%", "%#{query.strip}%", "%#{query.strip}%")}

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
