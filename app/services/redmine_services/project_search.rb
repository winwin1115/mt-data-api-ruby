class RedmineServices::ProjectSearch < ApplicationService
  def call
    RedmineProjectSearchJob.perform_now
  end
end