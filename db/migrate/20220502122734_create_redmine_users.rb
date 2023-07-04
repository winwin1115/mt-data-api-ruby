class CreateRedmineUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_users do |t|
      t.bigint :user_id, null: false, comment: "User id"
      t.string :login, null: false, comment: "Login Id"
      t.boolean :admin, null: false, comment: "Admin or User"
      t.string :firstname, null: false, comment: "First Name"
      t.string :lastname, null: false, comment: "Last Name"
      t.string :mail, comment: "Mail address"
      t.boolean :mail_notification, comment: "Mail Notification"
      t.integer :status, comment: "User Status"
      t.datetime :last_login_on, comment: "Last Login Time"
      t.string :language, comment: "Language"
      t.integer :auth_source_id
      t.datetime :created_on
      t.datetime :updated_on
      t.timestamps
    end
  end
end
