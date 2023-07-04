class RedmineServices::ProjectRelateSearch < ApplicationService
  def call
    RedmineProjectRelateSearchJob.perform_now
  end
end