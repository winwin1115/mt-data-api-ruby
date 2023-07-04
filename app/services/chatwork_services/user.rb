class ChatworkServices::User < ApplicationService
    attr_reader :params
  
    def initialize(params)
      @per_page = params[:per_page]
      @after    = params[:after]
    end
  
    def call
      if @per_page.present?
        @per_page = @per_page.to_i < 101 ? @per_page : 100
      else
        @per_page = 50
      end
      @users = ChatworkMyinfo.select("chatwork_myinfos.*, chatwork_mystatuses.unread_room_num, chatwork_mystatuses.mention_room_num, chatwork_mystatuses.mytask_room_num, chatwork_mystatuses.unread_num, chatwork_mystatuses.mention_num, chatwork_mystatuses.mytask_num")
      @users = @users.joins("LEFT JOIN chatwork_mystatuses ON chatwork_myinfos.account_id = chatwork_mystatuses.account_id")
      @users = @users.where("chatwork_myinfos.account_id >= ? ", @after ? @after : '0').limit(@per_page).order(:account_id)
      return @users
    end
  end