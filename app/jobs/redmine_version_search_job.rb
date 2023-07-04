class RedmineVersionSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    projectArray = RedmineProject.where(data_type: 'all')
    if projectArray.length
      projectArray.each do |project|
        result = []
        base_url = "https://www.redmine.org"

        url = "#{base_url}/projects/#{project['project_id']}/versions.json"
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        res = http.get(uri)
        temp = JSON.parse(res.body)
        result = temp['versions']
        
        result.each do |vers|
          begin
            redmine_version = RedmineVersion.new(
              version_id: vers['id'],
              project_id: project['project_id'],
              name: vers['name'],
              description: vers['description'],
              status: vers['status'],
              due_date: vers['due_date'],
              sharing: vers['sharing'],
              created_on: vers['created_on'],
              updated_on: vers['updated_on'],
              data_type: 'all'
            )
            redmine_version.save
          rescue => e
            flag = true
          end
        end
      end
    end
  end
end
