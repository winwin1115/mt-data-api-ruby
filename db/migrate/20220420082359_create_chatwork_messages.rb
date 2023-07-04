class CreateChatworkMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_messages do |t|
      t.bigint :room_id, null: false, comment: "Room Id"
      t.bigint :message_id, null: false, comment: "Message Id"
      t.bigint :account_id, null: false, comment: "Message sender Id"
      t.text :body, comment: "Message Text"
      t.bigint :send_time, comment: "Message Send Time"
      t.bigint :update_time, comment: "Message Update Time"
      t.timestamps
    end
  end
end
