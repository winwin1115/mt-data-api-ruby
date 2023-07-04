class RedmineServices::IssueRelateSearch < ApplicationService
  def call
    RedmineIssueRelateSearchJob.perform_now
  end
end