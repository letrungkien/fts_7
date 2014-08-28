class Admin::LevelsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  def index
    @levels = Level.all
  end

  def new
    @level = Level.new
  end

  def create
    @level = Level.new level_params
    if @level.save
      flash[:success] = "Create success"
      redirect_to [:admin, @level]
    else
      render "new"
    end
  end

  def edit
    @level = Level.find params[:id]
  end

  def update
    @level = Level.find params[:id]
    if @level.update_attributes level_params
      flash[:success] = "Level update"
      redirect_to [:admin, @level]
    else
      render "edit"      
    end
  end

  def show
  	@level = Level.find params[:id]
  end

  def destroy
    Level.find(params[:id]).destroy
    flash[:success] = "Level deleted."
    redirect_to root_url
  end

  private
  def level_params
    params.require(:level).permit(:name)
  end
end
