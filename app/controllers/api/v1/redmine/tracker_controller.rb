class Api::V1::Redmine::TrackerController < ApplicationController
  before_action :filter_params

  def getAllTracker
    RedmineServices::TrackerSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @trackers = RedmineServices::Tracker.call(filter_params)
    render json: @trackers, status: :ok
  end

  def show
    @tracker = RedmineTracker.where(tracker_id: params[:tracker_id])
    render json: @tracker, status: :ok
  end

  def filter_params
    params.slice(:tracker_id, :per_page, :after)
  end
end
