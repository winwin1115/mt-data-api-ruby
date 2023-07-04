class CreateRedmineGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_groups do |t|
      t.bigint :group_id, null: false, comment: "Group Id"
      t.string :name, null: false, comment: "Group Name"
      t.bigint :user_id, comment: "User Id"
      t.timestamps
    end
  end
end
