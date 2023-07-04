class Api::V1::Redmine::MembershipController < ApplicationController
  before_action :filter_params

  def getAllMembership
    RedmineServices::MembershipSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @memberships = RedmineServices::Membership.call(filter_params)
    render json: @memberships, status: :ok
  end

  def show
    @membership = RedmineMembership.where(project_id: params[:project_id])
    render json: @membership, status: :ok
  end

  def filter_params
    params.slice(:project_id, :per_page, :after)
  end
end
