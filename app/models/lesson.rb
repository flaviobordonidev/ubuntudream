class Lesson < ApplicationRecord
  # column_names and others (ActiveStorage, ActionText, Mobility, ...) 
  # in alphabetical order except: "id" always on top; "created_at" and "updated_at" always on bottom.
  # "id"
  # "description"
  # "description_rtf" (Mobility+ActionText)
  # "duration"
  # "name" (Mobility)
  # "picture_author_name" 
  # "picture_author_image" (ActiveStorage)
  # "picture_image" (ActiveStorage)
  # "picture_museum_name"
  # "created_at" 
  # "updated_at"

  # == Constants ============================================================
  
  # == Extensions ===========================================================

  ## i18n dynamic
  extend Mobility
  translates :name, type: :string
  translates :description_rtf, backend: :action_text
  
  # == Attributes ===========================================================

  ## ActionText
  #has_rich_text :description_rtf

  ## ActiveStorage
  has_one_attached :picture_image
  has_one_attached :picture_author_image

  # == Relationships ========================================================

  ## one-to-many
  has_many :steps, dependent: :destroy

  # == Validations ==========================================================

  # == Scopes ===============================================================

  scope :search, -> (query) {where("name ILIKE ?", "%#{query.strip}%")}

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
