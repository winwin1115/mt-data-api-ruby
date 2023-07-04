class Api::V1::Github::RepositorysController < ApplicationController
  def getRepositorys
    @repositorys = GithubRepository.all()
    render json: @repositorys, status: :ok
  end
end
