class Api::V1::Chatwork::RoomController < ApplicationController
  def show
    @room = ChatworkRoom.where(chatwork_id: params[:user])
    render json: @room, status: :ok
  end

  def getMember
    @member = ChatworkMember.where(room_id: params[:room_id])
    render json: @member, status: :ok
  end

  def getMessage
    @message = ChatworkMessage.where(room_id: params[:room_id])
    render json: @message, status: :ok
  end

  def oneMessage
    @message = ChatworkMessage.where(room_id: params[:room_id], message_id: params[:message_id])
    render json: @message, status: :ok
  end

  def getTask
    @task = ChatworkTask.where(room_id: params[:room_id])
    render json: @task, status: :ok
  end

  def oneTask
    @task = ChatworkTask.where(room_id: params[:room_id], task_id: params[:task_id])
    render json: @task, status: :ok
  end

  def getFile
    @file = ChatworkFile.where(room_id: params[:room_id])
    render json: @file, status: :ok
  end

  def oneFile
    @file = ChatworkFile.where(room_id: params[:room_id], file_id: params[:file_id])
    render json: @file, status: :ok
  end
end
