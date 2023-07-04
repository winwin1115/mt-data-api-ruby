class RedmineServices::IssuePriority < ApplicationService
  attr_reader :params

  def initialize(params)
    @per_page = params[:per_page]
    @after = params[:after]
  end

  def call
    if @per_page.present?
      @per_page = @per_page.to_i < 101 ? @per_page : 100
    else
      @per_page = 50
    end

    @issue_priorities = RedmineEnumeration.where("enumeration_id >= ? ", @after ? @after : 0).where("enumeration_type = ?", 'issue_priority').limit(@per_page).order(:enumeration_id)
    return @issue_priorities
  end
end