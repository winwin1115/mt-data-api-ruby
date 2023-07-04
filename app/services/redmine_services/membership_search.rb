class RedmineServices::MembershipSearch < ApplicationService
  def call
    RedmineMembershipSearchJob.perform_now
  end
end