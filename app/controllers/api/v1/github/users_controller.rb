class Api::V1::Github::UsersController < ApplicationController
  before_action :filter_params, only: %i[index]

  def getStart
    @time = Time.now + 60
    GithubServices::Search.call(@time)
  end

  def getTotal
    @count = GithubUser.count()
    render json: @count, status: :ok
  end

  def index
    @users = GithubServices::User.call(filter_params)
    render json: @users, status: :ok
  end

  def show
    begin
      @user = GithubUser.find_by(login: params[:user])
    rescue => e
      return render json: { message: "User not Found" }, status: :not_found
    end
    render json: @user, status: :ok
  end

  def getUserBaseInfo
    @user_info = GithubUsersBaseinfo.all()
    render json: @user_info, status: :ok
  end

  def filter_params
    params.slice(:per_page, :after, :user)
  end
end
