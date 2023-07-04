class RedmineRoleSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/roles.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['roles']

    result.each do |role|
      begin
        redmine_role = RedmineRole.new(
          role_id: role['id'],
          name: role['name'],
          data_type: 'all'
        )
        redmine_role.save
      rescue => e
        flag = true
      end
    end
  end
end
