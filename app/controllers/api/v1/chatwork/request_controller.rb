class Api::V1::Chatwork::RequestController < ApplicationController
  before_action :filter_params, only: %i[index]

  def index
    @requests = ChatworkServices::Request.call(filter_params)
    render json: @requests, status: :ok
  end

  def show
    @request = ChatworkRequest.where(account_id: params[:user])
    render json: @request, status: :ok
  end

  def filter_params
    params.slice(:per_page, :after, :user)
  end
end
