class Api::V1::Chatwork::TaskController < ApplicationController
  def show
    @task = ChatworkMytask.where(chatwork_id: params[:user])
    render json: @task, status: :ok
  end
end
