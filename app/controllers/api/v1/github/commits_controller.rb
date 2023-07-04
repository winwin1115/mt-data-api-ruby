class Api::V1::Github::CommitsController < ApplicationController
  def getCommits
    @commits = GithubCommit.all()
    render json: @commits, status: :ok
  end
end
