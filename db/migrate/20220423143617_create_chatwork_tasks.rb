class CreateChatworkTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_tasks do |t|
      t.bigint :room_id, null: false, comment: "Room Id"
      t.bigint :task_id, null: false, comment: "Task Id"
      t.bigint :account_id, comment: "Task Account Id"
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
