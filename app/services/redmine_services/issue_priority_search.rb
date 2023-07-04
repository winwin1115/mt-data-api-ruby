class RedmineServices::IssuePrioritySearch < ApplicationService
  def call
    RedmineIssuePrioritySearchJob.perform_now
  end
end