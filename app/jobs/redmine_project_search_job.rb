require 'net/http'
require 'uri'
require 'json'

class RedmineProjectSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    result = []
    base_url = "https://www.redmine.org"

    url = "#{base_url}/projects.json"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    res = http.get(uri)
    temp = JSON.parse(res.body)
    result = temp['projects']

    result.each do |project|
      begin
        redmine_project = RedmineProject.new(
          project_id: project['id'],
          name: project['name'],
          identifier: project['identifier'],
          description: project['description'],
          status: project['status'],
          created_on: project['created_on'],
          updated_on: project['updated_on'],
          data_type: 'all'
        )
        redmine_project.save
      rescue => e
        flag = true
      end
    end
  end
end
