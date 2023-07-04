class RedmineTrackerSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/trackers.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['trackers']

    result.each do |tracker|
      redmine_tracker = RedmineTracker.new(
        tracker_id: tracker['id'],
        name: tracker['name'],
        data_type: 'all'
      )
      redmine_tracker.save
    end
  end
end
