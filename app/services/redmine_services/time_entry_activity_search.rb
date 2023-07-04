class RedmineServices::TimeEntryActivitySearch < ApplicationService
  def call
    RedmineTimeEntryActivitySearchJob.perform_now
  end
end