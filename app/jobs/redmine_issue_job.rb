class RedmineIssueJob < ApplicationJob
  queue_as :default

  def perform(key, admin_url)
    result = []
    base_url = admin_url
    api_token = key

    url = "#{base_url}/issues.json"
    uri = URI.parse(url)

    req = Net::HTTP::Put.new(uri.request_uri)
    req['Content-Type'] = "application/json"
    req['X-Redmine-API-Key'] = api_token

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    res = http.get(req)
    temp = JSON.parse(res.body)
    result = temp['issues']

    result.each do |issue|
      if issue['category'].nil?
        category_id = nil
      else
        category_id = issue['category']['id']
      end
      if issue['assigned_to'].nil?
        assigned_to_id = nil
      else
        assigned_to_id = issue['assigned_to']['id']
      end
      begin
        redmine_issue = RedmineIssue.new(
          issue_id: issue['id'],
          project_id: issue['project']['id'],
          tracker_id: issue['tracker']['id'],
          status_id: issue['status']['id'],
          priority_id: issue['priority']['id'],
          subject: issue['subject'],
          description: issue['description'],
          author_id: issue['author']['id'],
          assigned_to_id: assigned_to_id,
          category_id: category_id,
          done_ratio: issue['done_ratio'],
          created_on: issue['created_on'],
          updated_on: issue['updated_on'],
          data_type: 'person'
        )
        redmine_issue.save
      rescue => e
        flag = true
      end
    end
  end
end
