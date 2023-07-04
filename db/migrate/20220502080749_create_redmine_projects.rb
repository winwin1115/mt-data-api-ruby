class CreateRedmineProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_projects do |t|
      t.bigint :project_id, null: false, comment: "Project Id"
      t.string :name, null: false, comment: "Project Name"
      t.string :identifier, comment: "Project Identifier"
      t.text :description, comment: "Project Description"
      t.integer :status, comment: "Project Status"
      t.string :homepage, comment: "Project Homepage"
      t.boolean :is_public, comment: "Public or Private"
      t.boolean :inherit_members, comment: "Inherit Members"
      t.bigint :parent_id, comment: "Project Parent Id"
      t.datetime :created_on, comment: "Created Time"
      t.datetime :updated_on, comment: "Updated Time"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
