class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def result
    @search = Search.new(params[:query_id])
  end

  private

    def query_params
      params.require(:query).permit(:email, :latitude, :longitude)
    end

end
