class CreateChatworkMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_members do |t|
      t.bigint :room_id, null: false, comment: "Room Id"
      t.bigint :account_id, null: false, comment: "Chatwork Account Id"
      t.string :role, comment: "Member Role"
      t.string :name, comment: "Member Name"
      t.string :chatwork_id, comment: "Profile Id"
      t.bigint :organization_id, comment: "Organization Id"
      t.string :organization_name, comment: "Organization Name"
      t.string :department, comment: "Department Name"
      t.string :avatar_image_url, comment: "Avatar Image Url"
      t.timestamps
    end
  end
end
