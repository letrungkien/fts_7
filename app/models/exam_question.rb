class ExamQuestion < ActiveRecord::Base
  has_many :exams
  has_many :exam_question_details
end
