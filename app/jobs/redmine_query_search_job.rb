class RedmineQuerySearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/queries.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['queries']

    result.each do |query|
      begin
        redmine_query = RedmineQuery.new(
          query_id: query['id'],
          name: query['name'],
          is_public: query['is_public'],
          project_id: query['project_id'],
          data_type: 'all'
        )
        redmine_query.save
      rescue => e
        flag = true
      end
    end
  end
end
