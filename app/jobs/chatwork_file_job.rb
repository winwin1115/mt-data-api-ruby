class ChatworkFileJob < ApplicationJob
  queue_as :default

  def perform(key)
    ChatWork.api_key = key
    begin
      resArray = ChatWork::Me.get
      
      roomArray = ChatworkRoom.where(account_id: resArray['account_id'])
      if roomArray.length
        roomArray.each do |room|
          fileArray = ChatWork::File.get(room_id: room['room_id'], account_id: resArray['account_id'])
          if !fileArray.nil?
            ChatworkFile.where(room_id: room['room_id']).destroy_all

            fileArray.each do |file|
              begin
                chatwork_file = ChatworkFile.new(
                  room_id: room['room_id'],
                  file_id: file['file_id'],
                  message_id: file['message_id'],
                  filesize: file['filesize'],
                  filename: file['filename'],
                  upload_time: file['upload_time'],
                  account_id: file['account']['account_id']
                )
                chatwork_file.save
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
