class CreateRedmineJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_journals do |t|
      t.bigint :journalized_id, null: false, comment: "Journals Id"
      t.string :journalized_type, comment: "Journals Type"
      t.bigint :user_id, comment: "User Id"
      t.text :notes, comment: "Journal Notes"
      t.boolean :private_notes
      t.datetime :created_on, comment: "Journal Created Time"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
