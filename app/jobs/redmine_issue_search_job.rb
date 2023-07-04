require 'net/https'
require 'uri'
require 'json'

class RedmineIssueSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    flag = false
    base_url = "https://www.redmine.org"
    loop do
      result = []
      last_point = RedmineIssue.count(:issue_id)
      if last_point
        url = "#{base_url}/issues.json?limit=100&offset=#{last_point}"
      else
        url = "#{base_url}/issues.json?limit=100&offset=0"
      end

      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      res = http.get(uri)
      temp = JSON.parse(res.body)
      result = temp['issues']

      if result.length != 0
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
              data_type: 'all'
            )
            redmine_issue.save
          rescue => e
            flag = true
          end
        end
      else
        flag = true
      end
      break if flag == true
    end
  end
end
