class RedmineDocumentCategorySearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/enumerations/document_categories.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['document_categories']

    result.each do |activity|
      begin
        redmine_activity = RedmineEnumeration.new(
          enumeration_id: activity['id'],
          name: activity['name'],
          enumeration_type: 'document_category',
          data_type: 'all'
        )
        redmine_activity.save
      rescue => e
        flag = true
      end
    end
  end
end
