class PapersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @papers = current_user.papers
  end

  def show
    @paper = Paper.find(params[:id])
    @paper.increment("view_count", 1).save
  end

  def new
    @paper = Paper.new
  end

  def edit
    @paper = current_user.papers.find(params[:id])
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
