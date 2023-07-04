class Api::V1::Redmine::EnumerationController < ApplicationController
  before_action :filter_params
  
  def getAllEnumeration
    RedmineServices::IssuePrioritySearch.call
    RedmineServices::DocumentCategorySearch.call
    RedmineServices::TimeEntryActivitySearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def getIssuePriority
    @issue_priorities = RedmineServices::IssuePriority.call(filter_params)
    render json: @issue_priorities, status: :ok
  end

  def oneIssuePriority
    @issue_priority = RedmineEnumeration.where(enumeration_id: params[:enumeration_id], enumeration_type: 'issue_priority')
    render json: @issue_priority, status: :ok
  end

  def getTimeEntryActivity
    @time_entry_activities = RedmineServices::TimeEntryActivity.call(filter_params)
    render json: @time_entry_activities, status: :ok
  end

  def oneTimeEntryActivity
    @time_entry_activity = RedmineEnumeration.where(enumeration_id: params[:enumeration_id], enumeration_type: 'time_entry_activity')
    render json: @time_entry_activity, status: :ok
  end

  def getDocumentCategory
    @document_categories = RedmineServices::DocumentCategory.call(filter_params)
    render json: @document_categories, status: :ok
  end

  def oneDocumentCategory
    @document_category = RedmineEnumeration.where(enumeration_id: params[:enumeration_id], enumeration_type: 'document_category')
    render json: @document_category, status: :ok
  end

  def filter_params
    params.slice(:enumeration_id, :per_page, :after)
  end
end
