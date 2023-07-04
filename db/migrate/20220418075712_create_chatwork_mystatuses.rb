class CreateChatworkMystatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_mystatuses do |t|
      t.bigint :account_id, null: false, comment: "Chatwork Account Id"
      t.string :chatwork_id, null: false, comment: "Profile Id"
      t.integer :unread_room_num, comment: "Unread Room Number"
      t.integer :mention_room_num, comment: "Mention Room Number"
      t.integer :mytask_room_num, comment: "Mytask Room Number"
      t.integer :unread_num, comment: "Unread Number"
      t.integer :mention_num, comment: "Mention Number"
      t.integer :mytask_num, comment: "Mytask Number"
      t.timestamps
    end
  end
end
