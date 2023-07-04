# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.

# require 'net/http'
#====================================
# Github Task
# class getGithubUser
#   def perform
#     uri = URI.parse("https://api.github.com/users/Erik1115")
#     request = Net::HTTP::get(uri)
#   end
# end

# Crono.perform(TestJob).every 2.days, at: '15:30'
#
