class CreateChatworkMyinfos < ActiveRecord::Migration[6.1]
  def change
    create_table :chatwork_myinfos do |t|
      t.bigint :account_id, null: false, comment: "Chatwork Myaccount Id"
      t.bigint :room_id, comment: "Room Id"
      t.string :name, comment: "Chatwork Name"
      t.string :chatwork_id, comment: "Profile Id"
      t.bigint :organization_id, comment: "Company Id"
      t.string :organization_name, comment: "Comapny Name"
      t.string :department, comment: "Department Name"
      t.string :title, comment: "Title"
      t.string :url, comment: "URL"
      t.text :introduction, comment: "Introduction Text"
      t.string :mail, comment: "Mail address"
      t.string :tel_organization, comment: "Tel Number Organization"
      t.string :tel_extension, comment: "Tel Number Extension"
      t.string :tel_mobile, comment: "Tel Mobile"
      t.string :skype, comment: "Skype Id"
      t.string :facebook, comment: "Facebook Id"
      t.string :twitter, comment: "Twitter Id"
      t.string :avatar_image_url, comment: "Avatar Image Url"
      t.string :login_mail, comment: "Login Email Address"
      t.timestamps
    end
  end
end
