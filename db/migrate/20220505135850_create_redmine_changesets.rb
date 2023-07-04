class CreateRedmineChangesets < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_changesets do |t|
      t.bigint :issue_id, null: false, comment: "Issue Id"
      t.integer :repository_id, comment: "Repository Id"
      t.string :revision, comment: "Revision"
      t.bigint :user_id, comment: "User Id"
      t.string :committer, comment: "Committer"
      t.datetime :committed_on, comment: "Committed Time"
      t.date :commit_date
      t.text :comments, comment: "Comments"
      t.string :scmid
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
