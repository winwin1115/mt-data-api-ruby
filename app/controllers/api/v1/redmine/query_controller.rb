class Api::V1::Redmine::QueryController < ApplicationController
  before_action :filter_params
  
  def getAllQuery
    RedmineServices::QuerySearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @queries = RedmineServices::Query.call(filter_params)
    render json: @queries, status: :ok
  end

  def show
    @query = RedmineQuery.where(query_id: params[:query_id])
    render json: @query, status: :ok
  end

  def filter_params
    params.slice(:query_id, :per_page, :after)
  end
end
