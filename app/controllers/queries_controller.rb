class QueriesController < ApplicationController

  def create
    query = Query.create(query_params)

    if query.save
      redirect_to result_path(query_id: query.id)
    else
      flash[:errors] = query.errors.full_messages
      redirect_to root_path
    end
  end

  private

    def query_params
      params.require(:query).permit(:email, :latitude, :longitude)
    end

end
