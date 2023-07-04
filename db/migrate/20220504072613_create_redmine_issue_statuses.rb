class CreateRedmineIssueStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_issue_statuses do |t|
      t.bigint :issue_status_id, null: false, comment: "Issue Status Id"
      t.string :name, null: false, comment: "Issue Status Name"
      t.boolean :is_closed, comment: "Open or Closed"
      t.boolean :is_default, comment: "Default or not"
      t.integer :position, comment: "Position"
      t.string :html_color, comment: "HTML Color"
      t.integer :default_done_ratio, comment: "Default Done Ratio"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
