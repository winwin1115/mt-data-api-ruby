class CreateRedmineIssueCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_issue_categories do |t|
      t.bigint :issue_category_id, null: false, comment: "Issue Category Id"
      t.bigint :project_id, comment: "Project Id"
      t.string :name, comment: "Issue Category Name"
      t.integer :assigned_to_id, comment: "Issue Assigned User Id"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
