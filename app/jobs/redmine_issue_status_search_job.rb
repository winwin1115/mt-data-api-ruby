class RedmineIssueStatusSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/issue_statuses.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['issue_statuses']

    result.each do |status|
      begin
        redmine_status = RedmineIssueStatus.new(
          issue_status_id: status['id'],
          name: status['name'],
          is_default: status['is_default'],
          is_closed: status['is_closed'],
          data_type: 'all'
        )
        redmine_status.save
      rescue => e
        flag = true
      end
    end
  end
end
