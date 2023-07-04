class RedmineServices::RoleSearch < ApplicationService
  def call
    RedmineRoleSearchJob.perform_now
  end
end