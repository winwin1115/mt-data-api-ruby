class CreateRedmineMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_memberships do |t|
      t.bigint :membership_id, null: false, comment: "Membership Id"
      t.bigint :project_id, null: false, comment: "Project Id"
      t.bigint :user_id, null: false, comment: "User Id"
      t.string :role_id, null: false, comment: "Role Id(multiple)"
      t.datetime :created_on, comment: "Membership created Time"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
