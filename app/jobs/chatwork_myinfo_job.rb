class ChatworkMyinfoJob < ApplicationJob
  queue_as :default

  def perform(key)
    # ChatWork.api_key = "2330d40cac3598ebdd1654e84deeae16"
    # ChatWork.api_key = "308c985d7a85a5b5210767fd59cb276c"
    ChatWork.api_key = key
    begin
      resArray = ChatWork::Me.get
      begin
        me = ChatworkMyinfo.find_by(account_id: resArray['account_id'])
        if me
          chatwork_me = ChatworkMyinfo.update(
            account_id: resArray['account_id'],
            room_id: resArray['room_id'],
            name: resArray['name'],
            chatwork_id: resArray['chatwork_id'],
            organization_id: resArray['organization_id'],
            organization_name: resArray['organization_name'],
            department: resArray['department'],
            title: resArray['title'],
            url: resArray['url'],
            introduction: resArray['introduction'],
            mail: resArray['mail'],
            tel_organization: resArray['tel_organization'],
            tel_extension: resArray['tel_extension'],
            tel_mobile: resArray['tel_mobile'],
            skype: resArray['skype'],
            facebook: resArray['facebook'],
            twitter: resArray['twitter'],
            avatar_image_url: resArray['avatar_image_url'],
            login_mail: resArray['login_mail']
          )
        else
          chatwork_me = ChatworkMyinfo.new(
            account_id: resArray['account_id'],
            room_id: resArray['room_id'],
            name: resArray['name'],
            chatwork_id: resArray['chatwork_id'],
            organization_id: resArray['organization_id'],
            organization_name: resArray['organization_name'],
            department: resArray['department'],
            title: resArray['title'],
            url: resArray['url'],
            introduction: resArray['introduction'],
            mail: resArray['mail'],
            tel_organization: resArray['tel_organization'],
            tel_extension: resArray['tel_extension'],
            tel_mobile: resArray['tel_mobile'],
            skype: resArray['skype'],
            facebook: resArray['facebook'],
            twitter: resArray['twitter'],
            avatar_image_url: resArray['avatar_image_url'],
            login_mail: resArray['login_mail']
          )
          chatwork_me.save
        end
      rescue => e
        flag = true
      end

      statusArray = ChatWork::MyStatus.get
      begin
        mystatus = ChatworkMystatus.find_by(account_id: resArray['account_id'])
        if mystatus
          chatwork_mystatus = ChatworkMystatus.update(
            account_id: resArray['account_id'],
            chatwork_id: resArray['chatwork_id'],
            unread_room_num: statusArray['unread_room_num'],
            mention_room_num: statusArray['mention_room_num'],
            mytask_room_num: statusArray['mytask_room_num'],
            unread_num: statusArray['unread_num'],
            mention_num: statusArray['mention_num'],
            mytask_num: statusArray['mytask_num']
          )
        else
          chatwork_mystatus = ChatworkMystatus.new(
            account_id: resArray['account_id'],
            chatwork_id: resArray['chatwork_id'],
            unread_room_num: statusArray['unread_room_num'],
            mention_room_num: statusArray['mention_room_num'],
            mytask_room_num: statusArray['mytask_room_num'],
            unread_num: statusArray['unread_num'],
            mention_num: statusArray['mention_num'],
            mytask_num: statusArray['mytask_num']
          )
          chatwork_mystatus.save
        end
      rescue => e
        flag = true
      end

      mytaskArray = ChatWork::MyTask.get
      if !mytaskArray.nil?
        ChatworkMytask.where(account_id: resArray['account_id']).destroy_all

        mytaskArray.each do |task|
          begin
            chatwork_mytask = ChatworkMytask.new(
              account_id: resArray['account_id'],
              chatwork_id: resArray['chatwork_id'],
              task_id: task['task_id'],
              room_id: task['room']['room_id'],
              assigner_id: task['assigned_by_account']['account_id'],
              message_id: task['message_id'],
              body: task['body'],
              limit_time: task['limit_time'],
              status: task['status'],
              limit_type: task['limit_type']
            )
            chatwork_mytask.save
          rescue => e
            flag = true
          end
        end
      end

      contactArray = ChatWork::Contacts.get
      if !contactArray.nil?
        ChatworkContact.where(contact_id: resArray['account_id']).destroy_all
        
        contactArray.each do |contact|
          begin
            chatwork_contact = ChatworkContact.new(
              contact_id: resArray['account_id'],
              contact_chatwork_id: resArray['chatwork_id'],
              account_id: contact['account_id'],
              room_id: contact['room_id'],
              name: contact['name'],
              chatwork_id: contact['chatwork_id'],
              organization_id: contact['organization_id'],
              organization_name: contact['organization_name'],
              department: contact['department'],
              avatar_image_url: contact['avatar_image_url']
            )
            chatwork_contact.save
          rescue => e
            flag = true
          end
        end
      end

      requestArray = ChatWork::IncomingRequest.get
      if !requestArray.nil?
        ChatworkRequest.where(account_id: resArray['account_id']).destroy_all

        requestArray.each do |request|
          begin
            chatwork_request = ChatworkRequest.new(
              account_id: resArray['account_id'],
              request_id: request['request_id'],
              sender_id: request['account_id'],
              message: request['message'],
              name: request['name'],
              chatwork_id: request['chatwork_id'],
              organization_id: request['organization_id'],
              organization_name: request['organization_name'],
              department: request['department'],
              avatar_image_url: request['avatar_image_url']
            )
            chatwork_request.save()
          rescue => e
            flag = true
          end
        end
      end

      roomArray = ChatWork::Room.get
      if !roomArray.nil?
        ChatworkRoom.where(account_id: resArray['account_id']).destroy_all
        
        roomArray.each do |room|
          begin
            chatwork_room = ChatworkRoom.new(
              account_id: resArray['account_id'],
              chatwork_id: resArray['chatwork_id'],
              room_id: room['room_id'],
              name: room['name'],
              room_type: room['type'],
              role: room['role'],
              sticky: room['sticky'],
              unread_num: room['unread_num'],
              mention_num: room['mention_num'],
              mytask_num: room['mytask_num'],
              message_num: room['message_num'],
              file_num: room['file_num'],
              task_num: room['task_num'],
              icon_path: room['icon_path'],
              last_update_time: room['last_update_time']
            )
            chatwork_room.save
          rescue => e
            flag = true
          end

          memberArray = ChatWork::Member.get(room_id: room['room_id'])
          if !memberArray.nil?
            ChatworkMember.where(room_id: room['room_id']).destroy_all

            memberArray.each do |member|
              begin
                chatwork_member = ChatworkMember.new(
                  room_id: room['room_id'],
                  account_id: member['account_id'],
                  role: member['role'],
                  name: member['name'],
                  chatwork_id: member['chatwork_id'],
                  organization_id: member['organization_id'],
                  organization_name: member['organization_name'],
                  department: member['department'],
                  avatar_image_url: member['avatar_image_url']
                )
                chatwork_member.save
              rescue => e
                flag = true
              end
            end
          end

          taskArray = ChatWork::Task.get(room_id: room['room_id'], account_id: resArray['account_id'])
          if !taskArray.nil?
            ChatworkTask.where(room_id: room['room_id']).destroy_all

            taskArray.each do |task|
              begin
                chatwork_task = ChatworkTask.new(
                  room_id: room['room_id'],
                  task_id: task['task_id'],
                  account_id: task['account']['account_id'],
                  assigner_id: task['assigned_by_account']['account_id'],
                  message_id: task['message_id'],
                  body: task['body'],
                  limit_time: task['limit_time'],
                  status: task['status'],
                  limit_type: task['limit_type'],
                )
                chatwork_task.save
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

# require 'net/https'
# require 'json'

# CW_API_TOKEN = "YOUR_API_CHATWORK"

# uri = URI('https://api.chatwork.com/v1/me')
# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# header = { "X-ChatWorkToken" => CW_API_TOKEN }
# body = nil

# res = http.get(uri, header)
# puts JSON.parse(res.body)
