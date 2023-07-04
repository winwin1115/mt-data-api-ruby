class CreateChatworkRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_rooms do |t|
      t.bigint :account_id, null: false, comment: "Chatwork Account Id"
      t.string :chatwork_id, null: false, comment: "Profile Id"
      t.bigint :room_id, null: false, comment: "Room Id"
      t.string :name, comment: "Customer Name"
      t.string :room_type, comment: "Room Type"
      t.string :role, comment: "Role Name"
      t.boolean :sticky, comment: "Sticky"
      t.integer :unread_num, comment: "Unread Number"
      t.integer :mention_num, comment: "Mention Number"
      t.integer :mytask_num, comment: "MyTask Number"
      t.integer :message_num, comment: "Message Number"
      t.integer :file_num, comment: "File Number"
      t.integer :task_num, comment: "Task Number"
      t.string :icon_path, comment: "Avatar Image Url"
      t.bigint :last_update_time, comment: "Last Updated Time"
      t.timestamps
    end
  end
end
