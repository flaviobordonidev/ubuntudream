class Lesson < ApplicationRecord
  # == Constants ============================================================
  
  # == Extensions ===========================================================

  # == Attributes ===========================================================

  ## ActiveText
  has_rich_text :description_rtf

  ## ActiveStorage
  has_one_attached :picture_image
  has_one_attached :picture_author_image

  # == Relationships ========================================================

  ## one-to-many
  has_many :steps, dependent: :destroy

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
