class PapersController < ApplicationController
  before_action :authenticate_user!

  def index
    @papers = current_user.papers
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
  end

  def edit
  end

  def create
    @paper = current_user.papers.new paper_params

    if @paper.save
      redirect_to @paper, notice: "Your paper was successfully uploaded"
    else
      render :new
    end
  end

  def update
  end

  def delete
  end

  private
    def paper_params
      params.require(:paper).permit(:title, :user_id, :description, attachments_fields: [:id, :file, :name, :description, :_destroy])
    end
end
