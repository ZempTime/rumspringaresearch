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
      @paper.attachments.each { |a| IndexAttachmentJob.perform_later a}
      redirect_to @paper, notice: "Your paper was successfully uploaded"
    else
      render :new
    end
  end

  def update
    @paper = current_user.papers.find(params[:id])

    if @paper.update paper_params
      redirect_to edit_paper_path(@paper), notice: "Your paper was successfully updated"
    else
      render :edit
    end
  end

  def delete
  end

  def download
    @paper = Paper.find(params[:paper_id])
    @attachment = @paper.attachments.find(params[:id])
    send_file @attachment.file.path
  end

  private
    def paper_params
      params.require(:paper).permit(:title, :user_id, :description, attachments_attributes: [:id, :paper_id, :file, :name, :description, :_destroy])
    end
end
