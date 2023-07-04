class RedmineMembershipSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    projectArray = RedmineProject.where(data_type: 'all')
    if projectArray.length
      projectArray.each do |project|
        result = []
        base_url = "https://www.redmine.org"

        url = "#{base_url}/projects/#{project['project_id']}/memberships.json"
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        res = http.get(uri)
        temp = JSON.parse(res.body)
        result = temp['memberships']

        result.each do |membership|
          if membership['project'].nil?
            project_id = nil
          else
            project_id = membership['project']['id']
          end
          if membership['user'].nil?
            user_id = nil
          else
            user_id = membership['user']['id']
          end
          role_id = ''
          if !membership['roles'].nil?
            roles = membership['roles']
            if roles.length >= 2
              roles.each do |role|
                role_id = "#{role['id']},#{role_id}"
              end
            else
              role_id = roles[0]['id']
            end
          end
          begin
            redmine_membership = RedmineMembership.new(
              membership_id: membership['id'],
              project_id: project_id,
              user_id: user_id,
              role_id: role_id,
              data_type: 'all'
            )
            redmine_membership.save
          rescue => e
            flag = true
          end
        end
      end
    end
  end
end
