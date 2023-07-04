class CreateRedmineNews < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_news do |t|
      t.bigint :news_id, null: false, comment: "News Id"
      t.bigint :project_id, null: false, comment: "Project Id"
      t.bigint :author_id
      t.string :title, null: false, comment: "News Title"
      t.string :summary, comment: "News summary"
      t.text :description, comment: "News description"
      t.integer :comments_count
      t.datetime :created_on
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
