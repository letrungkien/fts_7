class ExamAnswer < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  has_many :exam_answer_details
end
