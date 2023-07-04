class Api::V1::Github::IssuesController < ApplicationController
  def getIssues
    @issues = GithubIssue.all()
    render json: @issues, status: :ok
  end
end
