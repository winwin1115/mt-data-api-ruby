class Api::V1::Redmine::RoleController < ApplicationController
  before_action :filter_params

  def getAllRole
    RedmineServices::RoleSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @roles = RedmineServices::Role.call(filter_params)
    render json: @roles, status: :ok
  end

  def show
    @role = RedmineRole.where(role_id: params[:role_id])
    render json: @role, status: :ok
  end

  def filter_params
    params.slice(:role_id, :per_page, :after)
  end
end
