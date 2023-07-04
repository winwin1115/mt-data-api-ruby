class GithubServices::Search < ApplicationService
  attr_reader :time

  def initialize(time)
    @time = time
  end

  def call
    GithubUserJob.set(wait_until: @time).perform_later()
    GithubUserInfoJob.set(wait_until: @time).perform_later
  end
end