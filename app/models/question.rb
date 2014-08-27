class Question < ActiveRecord::Base
  has_many :exam_answers
  scope :list_by_subject_level, ->(subject_id, level_id) {
    where(subject_id: subject_id, level_id: level_id)
  }
  scope :list_by_type_with_quantity, ->(answer_type, quantity) {
    where(answer_type: answer_type).limit(quantity).order("RAND()")
  }
end
