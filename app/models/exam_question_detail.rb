class ExamQuestionDetail < ActiveRecord::Base
  belongs_to :exam_question
  validates :quantity, numericality: {greater_than_or_equal_to: 0}
  TEXT_BOX_QUESTION_TYPE = "T"
  CHECK_BOX_QUESTION_TYPE = "C"
  RADIO_BUTTON_QUESTION_TYPE = "R"
end