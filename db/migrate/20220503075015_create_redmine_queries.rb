class CreateRedmineQueries < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_queries do |t|
      t.bigint :query_id, null: false, comment: "Query Id"
      t.bigint :project_id, comment: "Project Id"
      t.string :name
      t.text :filters
      t.bigint :user_id
      t.boolean :is_public
      t.text :column_names
      t.text :sort_criteria
      t.string :group_by
      t.string :type
      t.integer :visibility
      t.text :options
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
