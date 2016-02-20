class PapersController < ApplicationController

  def index
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
      params.require(:paper).permit(:title, :user_id, :description, attachments_fields: [:file, :name])
    end
end
