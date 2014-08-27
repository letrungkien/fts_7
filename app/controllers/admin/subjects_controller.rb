class Admin::SubjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Create success"
      redirect_to [:admin, @subject]
    else
      render "new"
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = "Subject update"
      redirect_to [:admin, @subject]
    else
      render "edit"      
    end
  end

  def show
    @subject = Subject.find params[:id]
  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "Subject deleted."
    redirect_to root_url
  end

  private
  def subject_params
    params.require(:subject).permit(:name)
  end
end
