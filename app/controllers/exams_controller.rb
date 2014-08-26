class ExamsController < ApplicationController
  def create
    subject_id = params[:exams][:subject_id]
    level_id = params[:exams][:level_id]
    exam_question = ExamQuestion.find_by subject_id: subject_id, level_id: level_id
    if exam_question.nil?
      flash[:error] = "Sorry, we did not support your chosen subject/level yet"
      redirect_to exam_questions_path
    else
      exam = current_user.exams.new exam_question_id: exam_question.id
      exam.create_exam_answers
      if exam.save
        flash[:success] = "create new exam successfully"
        redirect_to edit_exam_path exam
      else
        flash[:error] = "can not start new exam, please check again"
        redirect_to exams_path
      end
    end
  end
  
  def edit
    @exam = Exam.find params[:id]
    @exam_answers = @exam.exam_answers
  end

  def index
    @subjects = Subject.all
    @levels = Level.all
  end
end