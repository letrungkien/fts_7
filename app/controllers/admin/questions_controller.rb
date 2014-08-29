class Admin::QuestionsController < ApplicationController
  before_action :signed_in_user
  before_action :is_admin
  before_action :initialize_variables

  def index
    if params[:subject_id].present? && params[:level_id].present?
      @questions = Question.list_by_subject_level(params[:subject_id], 
        params[:level_id])
    else
      @questions = Question.list_by_subject_level(Subject.first.id, 
        Level.first.id)
    end
  end

  def new
    unless @question.present?
      @question = Question.new(subject_id: params[:subject_id],
        level_id: params[:level_id])
      4.times {@question.answers.build}
    end
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Question created!"
      redirect_to admin_questions_path
    else
      flash[:failed] = "Question create failed!"
      render "new"
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:success] = "Question updated"
      redirect_to edit_admin_question_path @question
    else
      flash[:failed] = "Question update failed"
      render "edit"
    end
  end

  private
    def question_params
      params.require(:question).permit(:subject_id, :level_id, :answer_type, 
      	:content, answers_attributes:[:content, :right_answer, :id])
    end

    def initialize_variables
      @levels = Level.all
      @subjects = Subject.all
      @types = [["Text", Question::TEXT_BOX_QUESTION_TYPE], 
        ["Check box", Question::CHECK_BOX_QUESTION_TYPE], 
        ["Radio button", Question::RADIO_BUTTON_QUESTION_TYPE]]
    end

    def is_admin
      redirect_to root_url unless current_user.admin?
    end
end