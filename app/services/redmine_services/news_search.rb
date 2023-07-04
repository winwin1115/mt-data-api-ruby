class RedmineServices::NewsSearch < ApplicationService
  def call
    RedmineNewsSearchJob.perform_now
  end
end