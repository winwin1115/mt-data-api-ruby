class Api::V1::Redmine::IssueController < ApplicationController
  before_action :filter_params, only: %i[index]

  def getAllIssue
    RedmineServices::IssueSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def getAllIssueStatus
    RedmineServices::IssueStatusSearch.call
    render json: { message: "Information created successfully!" }, status: :ok
  end

  # def getIssue
    # RedmineServices::Issue.call(params[:key], params[:admin_url])
    # render json: { message: "Information created successfully!" }, status: :ok
    # result = []
    # base_url = params[:admin_url]
    # api_token = params[:key]

    # url = "#{base_url}/issues.json"
    # uri = URI.parse(url)

    # req = Net::HTTP::Put.new(uri.request_uri)
    # req["Content-Type"] = "application/json"
    # req["X-Redmine-API-Key"] = api_token

    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true

    # res = http.request(req)
    # temp = JSON.parse(res.body)
    # result = temp['issues']

    # render json: result
    # result.each do |issue|
    #   if issue['category'].nil?
    #     category_id = nil
    #   else
    #     category_id = issue['category']['id']
    #   end
    #   if issue['assigned_to'].nil?
    #     assigned_to_id = nil
    #   else
    #     assigned_to_id = issue['assigned_to']['id']
    #   end
    #   begin
    #     redmine_issue = RedmineIssue.new(
    #       issue_id: issue['id'],
    #       project_id: issue['project']['id'],
    #       tracker_id: issue['tracker']['id'],
    #       status_id: issue['status']['id'],
    #       priority_id: issue['priority']['id'],
    #       subject: issue['subject'],
    #       description: issue['description'],
    #       author_id: issue['author']['id'],
    #       assigned_to_id: assigned_to_id,
    #       category_id: category_id,
    #       done_ratio: issue['done_ratio'],
    #       created_on: issue['created_on'],
    #       updated_on: issue['updated_on'],
    #       data_type: 'person'
    #     )
    #     redmine_issue.save
    #   rescue => e
    #     flag = true
    #   end
    # end
  # end

  def index
    @issues = RedmineServices::Issue.call(filter_params)
    render json: @issues, status: :ok
  end

  def show
    @issue = RedmineIssue.where(issue_id: params[:issue_id])
    render json: @issue, status: :ok
  end

  def getIssueStatus
    @issue_statuses = RedmineServices::IssueStatus.call(filter_params)
    render json: @issue_statuses, status: :ok
  end

  def oneIssueStatus
    @issue_status = RedmineIssueStatus.where(issue_status_id: params[:status_id])
    render json: @issue_status, status: :ok
  end

  def filter_params
    params.slice(:issue_id, :status_id, :per_page, :after)
  end
end
