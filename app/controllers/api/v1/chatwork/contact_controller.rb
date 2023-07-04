class Api::V1::Chatwork::ContactController < ApplicationController
  def show
    @contact = ChatworkContact.where(contact_chatwork_id: params[:user])
    render json: @contact, status: :ok
  end
end
