class CreateRedmineIssueRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_issue_relations do |t|
      t.bigint :issue_relation_id, null: false, comment: "Issue Relation Id"
      t.bigint :issue_from_id, null: false, comment: "Issue From Id"
      t.bigint :issue_to_id, null: false, comment: "Issue To Id"
      t.string :relation_type, comment: "Relation Type"
      t.integer :delay, comment: "Delay"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
