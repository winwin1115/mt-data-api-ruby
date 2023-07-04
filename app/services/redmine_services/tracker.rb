class RedmineServices::Tracker < ApplicationService
  attr_reader :params

  def initialize(params)
    @per_page = params[:per_page]
    @after = params[:after]
  end

  def call
    if @per_page.present?
      @per_page = @per_page.to_i < 101 ? @per_page : 100
    else
      @per_page = 50
    end

    @trackers = RedmineTracker.where("tracker_id >= ? ", @after ? @after : 0).limit(@per_page).order(:tracker_id)
    return @trackers
  end
end