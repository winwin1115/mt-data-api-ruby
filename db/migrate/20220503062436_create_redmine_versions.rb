class CreateRedmineVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_versions do |t|
      t.bigint :version_id, null: false, comment: "Version Id"
      t.bigint :project_id, null: false, comment: "Project Id"
      t.string :name
      t.string :description
      t.string :status
      t.string :sharing
      t.date :due_date
      t.string :wiki_page_title
      t.date :effective_date
      t.datetime :created_on
      t.datetime :updated_on
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
