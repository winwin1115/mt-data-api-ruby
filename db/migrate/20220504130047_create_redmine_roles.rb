class CreateRedmineRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_roles do |t|
      t.bigint :role_id, null: false, comment: "Role Id"
      t.string :name, comment: "Role Name"
      t.integer :position, comment: "Position"
      t.boolean :assignable
      t.integer :builtin
      t.text :permissions
      t.string :issues_visibility
      t.string :users_visibility
      t.string :time_entries_visibility
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
