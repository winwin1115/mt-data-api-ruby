class RedmineServices::Journal < ApplicationService
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

    @journals = RedmineJournal.joins("LEFT JOIN redmine_journal_details ON redmine_journal_details.journal_id = redmine_journals.journalized_id")
    @journals = @journals.where("journalized_id >= ? ", @after ? @after : 0).limit(@per_page).order(:journalized_id)
    return @journals
  end
end