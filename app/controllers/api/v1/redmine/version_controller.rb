class Api::V1::Redmine::VersionController < ApplicationController
  before_action :filter_params

  def getAllVersion
    RedmineServices::VersionSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @versions = RedmineServices::Version.call(filter_params)
    render json: @versions, status: :ok
  end

  def show
    @version = RedmineVersion.where(version_id: params[:version_id])
    render json: @version, status: :ok
  end

  def filter_params
    params.slice(:version_id, :per_page, :after)
  end
end
