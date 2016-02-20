class PapersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def new
    @paper = Paper.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end
end
