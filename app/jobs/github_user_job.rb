require 'net/http'

class GithubUserJob < ActiveJob::Base
  # Set the Queue as Default
  queue_as :default

  def perform
    flag = false
    loop do
      resArray = []
      last_user = GithubUser.maximum(:github_id)
      if last_user
        uri = URI.parse("https://api.github.com/users?per_page=100&since=" + last_user.to_s)
      else
        uri = URI.parse("https://api.github.com/users?per_page=100")
      end
      response = Net::HTTP.get(uri)

      resArray = JSON.parse(response)
      resArray.each do |user|
        begin
          git_user = GithubUser.new(
            login: user['login'],
            github_id: user['id'],
            node_id: user['node_id'],
            avatar_url: user['avatar_url'],
            gravatar_id: user['gravatar_id'],
            url: user['url'],
            html_url: user['html_url'],
            followers_url: user['followers_url'],
            following_url: user['following_url'],
            gists_url: user['gists_url'],
            starred_url: user['starred_url'],
            subscriptions_url: user['subscriptions_url'],
            repos_url: user['repos_url'],
            events_url: user['events_url'],
            received_events_url: user['received_events_url'],
            type: user['type'],
            site_admin: user['site_admin']
          )
          git_user.save
        rescue => e
          flag = true
          # GithubServices::Search.call()    
        end
      end
      break if flag == true
    end
  end
end

# base_uri = URI.parse("https://api.github.com/users/" + user['login'])
#         base_response = Net::HTTP.get(base_uri)
#         baseRes =  JSON.parse(base_response)
#         base_info = GithubUsersBaseinfo.new(
#           login: baseRes['login'],
#           name: baseRes['name'],
#           company: baseRes['company'],
#           blog: baseRes['blog'],
#           location: baseRes['location'],
#           email: baseRes['email'],
#           hireable: baseRes['hireable'],
#           bio: baseRes['bio'],
#           twitter_username: baseRes['twitter_username'],
#           public_repos: baseRes['public_repos'],
#           public_gists: baseRes['public_gists'],
#           followers: baseRes['followers'],
#           following: baseRes['following'],
#           create_time: baseRes['created_at'],
#           update_time: baseRes['updated_at']
#         )
#         base_info.save