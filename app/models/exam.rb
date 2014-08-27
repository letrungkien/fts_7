class Exam < ActiveRecord::Base
  belongs_to :user
  has_many :exam_answers
  has_many :exam_answer_details, through: :exam_answers
  belongs_to :exam_question
  def create_exam_answers
    @questions = Question.list_by_subject_level self.exam_question.subject_id, 
                                                self.exam_question.level_id
    @question_list = []
    @exam_question_details = self.exam_question.exam_question_details
    @exam_question_details.each do |exam_question_detail|
      quantity = exam_question_detail.quantity
      answer_type = exam_question_detail.answer_type
      if quantity > 0
        @question_list += @questions.list_by_type_with_quantity answer_type, quantity
      end
    end
    @question_list.each do |question|
      self.exam_answers.build question_id: question.id
    end
  end
end
