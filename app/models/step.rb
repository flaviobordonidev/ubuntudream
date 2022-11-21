class Step < ApplicationRecord
  # == Constants ============================================================
  
  # == Extensions ===========================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================

  ## many-to-one
  belongs_to :lesson

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  def next
    lesson.steps.where("id > ?", id).first
  end

  def prev
    lesson.steps.where("id < ?", id).last
  end
end
