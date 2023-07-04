class CreateChatworkFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_files do |t|
      t.bigint :room_id, null: false, comment: "Room Id"
      t.bigint :file_id, null: false, comment: "File Id"
      t.string :message_id, comment: "Message Id"
      t.string :filesize, comment: "File Size"
      t.string :filename, comment: "File Name"
      t.string :upload_time, comment: "Upload Time"
      t.bigint :account_id, comment: "Account Id"
      t.timestamps
    end
  end
end
