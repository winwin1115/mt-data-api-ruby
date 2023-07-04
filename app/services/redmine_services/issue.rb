class RedmineServices::Issue < ApplicationService
  # attr_reader :key, :admin_url
  attr_reader :params

  def initialize(params)
    # @key = key
    # @admin_url = admin_url
    @per_page = params[:per_page]
    @after = params[:after]
  end

  def call
    # RedmineIssueJob.perform_now(@key, @admin_url)
    if @per_page.present?
      @per_page = @per_page.to_i < 101 ? @per_page : 100
    else
      @per_page = 50
    end

    @issues = RedmineIssue.where("issue_id >= ? ", @after ? @after : 0).limit(@per_page).order(:issue_id)
    return @issues
  end
end