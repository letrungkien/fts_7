class ExamQuestion < ActiveRecord::Base
  belongs_to :subject
  belongs_to :level
  has_many :exams
  has_many :exam_question_details
  accepts_nested_attributes_for :exam_question_details
end
