class ChatworkMessageJob < ApplicationJob
  queue_as :default

  def perform(key)
    ChatWork.api_key = key
    begin
      resArray = ChatWork::Me.get

      roomArray = ChatworkRoom.where(account_id: resArray['account_id'])
      if roomArray.length
        roomArray.each do |room|
          messageArray = ChatWork::Message.get(room_id: room['room_id'])
          if !messageArray.nil?
            ChatworkMessage.where(room_id: room['room_id']).destroy_all

            messageArray.each do |message|
              begin
                chatwork_message = ChatworkMessage.new(
                  room_id: room['room_id'],
                  message_id: message['message_id'],
                  account_id: message['account']['account_id'],
                  body: message['body'],
                  send_time: message['send_time'],
                  update_time: message['update_time']
                )
                chatwork_message.save
              rescue => e
                flag = true
              end
            end
          end
        end
      end
    rescue ChatWork::APIError => e

    end
  end
end
