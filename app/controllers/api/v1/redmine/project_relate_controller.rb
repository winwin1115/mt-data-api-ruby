class Api::V1::Redmine::ProjectRelateController < ApplicationController
  def getAllProjectRelate
    RedmineServices::ProjectRelateSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end
end
