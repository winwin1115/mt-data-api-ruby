class CreateRedmineIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_issues do |t|
      t.bigint :issue_id, null: false, comment: "Issue Id"
      t.bigint :project_id, null: false, comment: "Project Id"
      t.bigint :tracker_id, null: false, comment: "Tracker Id"
      t.bigint :status_id, null: false, comment: "Status Id"
      t.bigint :priority_id, null: false, comment: "Priority Id"
      t.string :subject, null: false, comment: "Issue Subject"
      t.text :description, comment: "Issue Description"
      t.bigint :category_id, comment: "Category Id"
      t.bigint :assigned_to_id
      t.bigint :author_id
      t.boolean :is_private
      t.integer :estimated_hours
      t.date :start_date
      t.date :due_date
      t.integer :done_ratio
      t.datetime :created_on
      t.datetime :updated_on
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
