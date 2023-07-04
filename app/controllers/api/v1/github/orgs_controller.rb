class Api::V1::Github::OrgsController < ApplicationController
  def getOrgs
    @orgs = GithubOrg.all()
    render json: @orgs, status: :ok
  end
end
