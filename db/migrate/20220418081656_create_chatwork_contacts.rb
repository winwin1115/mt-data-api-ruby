class CreateChatworkContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_contacts do |t|
      t.bigint :contact_id, null: false, comment: "Contact Id"
      t.string :contact_chatwork_id, null: false, comment: "Contact Chatwork Id"
      t.bigint :account_id, null: false, comment: "Chatwork Account Id"
      t.bigint :room_id, comment: "Room Id"
      t.string :name, comment: "Chatwork Name"
      t.string :chatwork_id, comment: "Profile Id"
      t.bigint :organization_id, comment: "Organization Id"
      t.string :organization_name, comment: "Organization Name"
      t.string :department, comment: "Department Name"
      t.string :avatar_image_url, comment: "Avatart Image Url"
      t.timestamps
    end
  end
end
