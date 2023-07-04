class CreateRedmineTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_tokens do |t|
      t.bigint :token_id, null: false, comment: "Token Id"
      t.bigint :user_id, null: false, comment: "User Id"
      t.string :action, comment: "Action"
      t.string :value, comment: "Token Value"
      t.datetime :created_on, comment: "Token Created Time"
      t.datetime :updated_on, comment: "Token Updated Time"
      t.timestamps
    end
  end
end
