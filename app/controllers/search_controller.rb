class SearchController < ApplicationController
  def index
    @papers = Paper.search(search_query, page: params[:page], per_page: 12)
  end

  def landing
  end

  def about
  end

  private
    def search_query
      return params[:q] unless params[:q]&.empty?
      @no_results = true
      "*"
    end
end
