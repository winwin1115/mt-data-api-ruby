class Api::V1::Redmine::IssueRelateController < ApplicationController
  before_action :filter_params

  def getAllIssueRelate
    RedmineServices::IssueRelateSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def getAttachment
    @attachments = RedmineServices::Attachment.call(filter_params)
    render json: @attachments, status: :ok
  end

  def oneAttachment
    @attachment = RedmineAttachment.where(attachment_id: params[:attachment_id])
    render json: @attachment, status: :ok
  end

  def getChangeset
    @changesets = RedmineServices::Changeset.call(filter_params)
    render json: @changesets, status: :ok
  end

  def oneChangeset
    @changeset = RedmineChangeset.where(issue_id: params[:issue_id])
    render json: @changeset, status: :ok
  end

  def getCustomField
    @custom_fields = RedmineServices::CustomField.call(filter_params)
    render json: @custom_fields, status: :ok
  end

  def oneCustomField
    @custom_field = RedmineCustomField.where(custom_field_id: params[:custom_id])
    render json: @custom_field, status: :ok
  end

  def getIssueCategory
    @issue_categories = RedmineServices::IssueCategory.call(filter_params)
    render json: @issue_categories, status: :ok
  end

  def oneIssueCategory
    @issue_category = RedmineIssueCategory.where(issue_category_id: params[:category_id])
    render json: @issue_category, status: :ok
  end

  def getIssueRelation
    @issue_relations = RedmineServices::IssueRelation.call(filter_params)
    render json: @issue_relations, status: :ok
  end

  def oneIssueRelation
    @issue_relation = RedmineIssueRelation.where(issue_relation_id: params[:relation_id])
    render json: @issue_relation, status: :ok
  end

  def getJournal
    @journals = RedmineServices::Journal.call(filter_params)
    render json: @journals, status: :ok
  end

  def oneJournal
    @journal = RedmineJournal.joins("LEFT JOIN redmine_journal_details ON redmine_journal_details.journal_id = redmine_journals.journalized_id")
    @journal = @journal.where(journalized_id: params[:journal_id])
    render json: @journal, status: :ok
  end

  def filter_params
    params.slice(:attachment_id, :issue_id, :custom_id, :category_id, :relation_id, :per_page, :after)
  end
end
