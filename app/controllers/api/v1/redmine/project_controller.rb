class Api::V1::Redmine::ProjectController < ApplicationController
  before_action :filter_params, only: %i[index]

  def getAllProject
    RedmineServices::ProjectSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @projects = RedmineServices::Project.call(filter_params)
    render json: @projects, status: :ok
  end

  def show
    @project = RedmineProject.where(project_id: params[:project_id])
    render json: @project, status: :ok
  end

  def filter_params
    params.slice(:project_id, :per_page, :after)
  end
end
