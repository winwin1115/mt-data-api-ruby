class RedmineServices::IssueSearch < ApplicationService
  def call
    RedmineIssueSearchJob.perform_now
  end
end