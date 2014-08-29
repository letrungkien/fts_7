class Question < ActiveRecord::Base
  has_many :exam_answers
  has_many :answers
  belongs_to :subject
  belongs_to :level
  accepts_nested_attributes_for :answers
  validates :content, presence: true
  scope :list_by_subject_level, ->(subject_id, level_id) {
    where(subject_id: subject_id, level_id: level_id)
  }
  scope :list_by_type_with_quantity, ->(answer_type, quantity) {
    where(answer_type: answer_type).limit(quantity).order("RAND()")
  }
  TEXT_BOX_QUESTION_TYPE = "T"
  CHECK_BOX_QUESTION_TYPE = "C"
  RADIO_BUTTON_QUESTION_TYPE = "R"
end