class RedmineServices::TrackerSearch < ApplicationService
  def call
    RedmineTrackerSearchJob.perform_now
  end
end