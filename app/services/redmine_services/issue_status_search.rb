class RedmineServices::IssueStatusSearch < ApplicationService
  def call
    RedmineIssueStatusSearchJob.perform_now
  end
end