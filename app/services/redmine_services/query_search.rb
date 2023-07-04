class RedmineServices::QuerySearch < ApplicationService
  def call
    RedmineQuerySearchJob.perform_now
  end
end