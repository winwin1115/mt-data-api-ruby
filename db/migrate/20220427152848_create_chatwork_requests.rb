class CreateChatworkRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_requests do |t|
      t.bigint :account_id, null: false, comment: "Chatwork Account Id"
      t.bigint :request_id, null: false, comment: "Incoming Request Id"
      t.bigint :sender_id, comment: "Sender Account Id"
      t.text :message, comment: "Message Body"
      t.string :name, comment: "Sender Name"
      t.string :chatwork_id, comment: "Chatwork Id"
      t.bigint :organization_id, comment: "Organization Id"
      t.string :organization_name, comment: "Organization Name"
      t.string :department, comment: "Department Name"
      t.string :avatar_image_url, comment: "Avatar Image Url"
      t.timestamps
    end
  end
end
