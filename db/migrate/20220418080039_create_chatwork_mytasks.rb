class CreateChatworkMytasks < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_mytasks do |t|
      t.bigint :account_id, null: false, comment: "Chatwork Account Id"
      t.string :chatwork_id, null: false, comment: "Profile Id"
      t.bigint :task_id, comment: "Task Id"
      t.bigint :room_id, comment: "Room Id"
      t.bigint :assigner_id, comment: "Assigner Id"
      t.string :message_id, comment: "Message Id"
      t.text :body, comment: "Task Body"
      t.string :limit_time, comment: "Limit Time"
      t.string :status, comment: "Task Status"
      t.string :limit_type, comment: "Task Type"
      t.timestamps
    end
  end
end
