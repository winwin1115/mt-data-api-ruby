class RedmineIssuePrioritySearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/enumerations/issue_priorities.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['issue_priorities']

    result.each do |eee|
      begin
        redmine_enumeration = RedmineEnumeration.new(
          enumeration_id: eee['id'],
          name: eee['name'],
          enumeration_type: 'issue_priority',
          is_default: eee['is_default'],
          data_type: 'all'
        )
        redmine_enumeration.save
      rescue => e
        flag = true
      end
    end
  end
end
