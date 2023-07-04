class Api::V1::Chatwork::MyController < ApplicationController
  before_action :filter_params, only: %i[index]

  def getStart
    ChatworkServices::Search.call(params[:key])
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def getMessage
    ChatworkServices::Message.call(params[:key])
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def getFile
    ChatworkServices::File.call(params[:key])
    render json: { message: "Information created successfully!" }, status: :ok
  end

  def index
    @users = ChatworkServices::User.call(filter_params)
    render json: @users, status: :ok
  end

  def show
    begin
      @user = ChatworkMyinfo.select("chatwork_myinfos.*, chatwork_mystatuses.unread_room_num, chatwork_mystatuses.mention_room_num, chatwork_mystatuses.mytask_room_num, chatwork_mystatuses.unread_num, chatwork_mystatuses.mention_num, chatwork_mystatuses.mytask_num")
      @user = @user.joins("LEFT JOIN chatwork_mystatuses ON chatwork_myinfos.account_id = chatwork_mystatuses.account_id")
      @user = @user.find_by(chatwork_id: params[:user])
    rescue => e
      return render json: { message: "User not Found" }, status: :not_found
    end
    render json: @user, status: :ok
  end

  def filter_params
    params.slice(:key, :per_page, :after, :user)
  end
end
