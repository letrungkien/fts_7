class Admin::ExamQuestionsController < ApplicationController
  def new
    @levels = Level.all
    @subjects = Subject.all
    @exam_question = ExamQuestion.new
    @exam_question.exam_question_details.build(
      answer_type: ExamQuestionDetail::TEXT_BOX_QUESTION_TYPE, 
      quantity: "0")
    @exam_question.exam_question_details.build(
      answer_type: ExamQuestionDetail::CHECK_BOX_QUESTION_TYPE, 
      quantity: "0")
    @exam_question.exam_question_details.build(
      answer_type: ExamQuestionDetail::RADIO_BUTTON_QUESTION_TYPE, 
      quantity: "0")
  end

  def edit
    @levels = Level.all
    @subjects = Subject.all
    @exam_question = ExamQuestion.find params[:id]
  end

  def index
    @exam_questions = ExamQuestion.all
  end

  def create
    @exam_question = ExamQuestion.find_by(
      subject_id: params[:subject_id],
      level_id: params[:level_id])
    if @exam_question.nil?
      @exam_question = ExamQuestion.new exam_question_params
      
      if @exam_question.save
        flash[:success] = "Exam Question created!"
        redirect_to admin_exam_questions_path
      else
        flash[:failed] = "Exam Question failed to create!"
        render new_admin_exam_question_path
      end 
    else
      flash[:failed] = "Exam Question already existed!"
      redirect_to new_admin_exam_question_path
    end
  end

  def update
    exam_question = ExamQuestion.find params[:id]
    if exam_question.update_attributes exam_question_params
      flash[:success] = "Exam Question updated"
      redirect_to admin_exam_questions_path
    else
      flash[:failed] = "Exam Question update failed"
      render edit_admin_exam_question_path exam_question
    end
  end

  private
    def exam_question_params
      params.require(:exam_question).permit(:subject_id, :level_id, :name,
        exam_question_details_attributes:[:quantity, :answer_type, :id])
    end
end