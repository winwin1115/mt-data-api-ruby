class RedmineProjectRelateSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    projectArray = RedmineProject.where(data_type: 'all')
    if projectArray.length
      projectArray.each do |project|
        result = []
        base_url = "https://www.redmine.org"

        url = "#{base_url}/projects/#{project['project_id']}.json?include=trackers,issue_categories,enabled_modules,time_entry_activities,repositories"
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        res = http.get(uri)
        temp = JSON.parse(res.body)
        result = temp['project']
        
        if result.length && !result['issue_categories'].nil?
          issue_categories = result['issue_categories']

          issue_categories.each do |item|
            begin
              redmine_issue_category = RedmineIssueCategory.new(
                issue_category_id: item['id'],
                project_id: result['id'],
                name: item['name'],
                data_type: 'all'
              )
              redmine_issue_category.save
            rescue => e
              flag = true
            end
          end
        end
      end
    end
  end
end
