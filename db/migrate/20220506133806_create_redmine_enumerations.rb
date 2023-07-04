class CreateRedmineEnumerations < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_enumerations do |t|
      t.bigint :enumeration_id, null: false, comment: "Enumeration Id"
      t.string :name, null: false, comment: "Enumeration Name"
      t.integer :position, comment: "Position"
      t.boolean :is_default, comment: "Default Status"
      t.string :enumeration_type, comment: "Enumeration Type"
      t.boolean :active, comment: "Active Status"
      t.bigint :project_id, comment: "Project Id"
      t.bigint :parent_id, comment: "Parent Id"
      t.string :position_name, comment: "Position Name"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
