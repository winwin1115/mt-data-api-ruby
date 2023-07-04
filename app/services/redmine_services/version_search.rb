class RedmineServices::VersionSearch < ApplicationService
  def call
    RedmineVersionSearchJob.perform_now
  end
end