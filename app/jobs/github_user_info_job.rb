class GithubUserInfoJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    flag = false
    resArray = []
    last_user = GithubUsersBaseinfo.maximum(:id)
    if last_user
      users = GithubUser.where("id >= ? ", last_user).limit(60)
    else
      users = GithubUser.limit(60)
    end

    users.each do |user|
      begin
        uri = URI.parse("https://api.github.com/users/" + user['login'].to_s)
        response = Net::HTTP.get(uri)
        resArray = JSON.parse(response)
        resArray.each do |info|
          base_info = GithubUsersBaseinfo.new(
            login: baseRes['login'],
            name: baseRes['name'],
            company: baseRes['company'],
            blog: baseRes['blog'],
            location: baseRes['location'],
            email: baseRes['email'],
            hireable: baseRes['hireable'],
            bio: baseRes['bio'],
            twitter_username: baseRes['twitter_username'],
            public_repos: baseRes['public_repos'],
            public_gists: baseRes['public_gists'],
            followers: baseRes['followers'],
            following: baseRes['following'],
            create_time: baseRes['created_at'],
            update_time: baseRes['updated_at']
          )
          base_info.save
        end
      rescue => e
        flag = true
        # GithubServices::Search.call()    
      end
    end
  end
end
