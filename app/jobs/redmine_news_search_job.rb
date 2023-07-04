class RedmineNewsSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    flag = false
    base_url = "https://www.redmine.org"
    loop do
      result = []
      last_point = RedmineNews.count(:news_id)
      if last_point
        url = "#{base_url}/news.json?limit=100&offset=#{last_point}"
      else
        url = "#{base_url}/news.json?limit=100&offset=0"
      end
      
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      res = http.get(uri)
      temp = JSON.parse(res.body)
      result = temp['news']

      if result.length != 0
        result.each do |news|
          begin
            redmine_news = RedmineNews.new(
              news_id: news['id'],
              project_id: news['project']['id'],
              title: news['title'],
              summary: news['summary'],
              author_id: news['author']['id'],
              description: news['description'],
              created_on: news['created_on'],
              data_type: 'all'
            )
            redmine_news.save
          rescue => e
            flag = true
          end
        end
      else
        flag = true
      end
      break if flag == true
    end
  end
end
