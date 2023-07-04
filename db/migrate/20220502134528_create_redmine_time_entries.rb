class CreateRedmineTimeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_time_entries do |t|
      t.bigint :time_entry_id, null: false, comment: "Time Entry Id"
      t.bigint :project_id, null: false, comment: "Project Id"
      t.bigint :user_id, null: false, comment: "User Id"
      t.bigint :issue_id, comment: "Issue Id"
      t.float :hours, comment: "Hours"
      t.string :comments
      t.integer :activity_id
      t.datetime :spent_on
      t.integer :tyear
      t.integer :tmonth
      t.integer :tweek
      t.datetime :created_on
      t.datetime :updated_on
      t.timestamps
    end
  end
end
