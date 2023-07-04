class Api::V1::Redmine::NewsController < ApplicationController
  before_action :filter_params

  def getAllNews
    RedmineServices::NewsSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @news = RedmineServices::News.call(filter_params)
    render json: @news, status: :ok
  end

  def show
    @news = RedmineNews.where(news_id: params[:news_id])
    render json: @news, status: :ok
  end

  def filter_params
    params.slice(:news_id, :per_page, :after)
  end
end
