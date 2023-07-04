class RedmineTimeEntryActivitySearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/enumerations/time_entry_activities.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['time_entry_activities']

    result.each do |activity|
      begin
        redmine_activity = RedmineEnumeration.new(
          enumeration_id: activity['id'],
          name: activity['name'],
          enumeration_type: 'time_entry_activity',
          data_type: 'all'
        )
        redmine_activity.save
      rescue => e
        flag = true
      end
    end
  end
end
