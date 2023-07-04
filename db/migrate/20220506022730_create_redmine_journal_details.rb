class CreateRedmineJournalDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_journal_details do |t|
      t.bigint :journal_id, null: false, comment: "Journal Id"
      t.string :property, null: false, comment: "Property"
      t.string :name, comment: "Journal Name"
      t.string :prop_key, comment: "Prop Key"
      t.text :old_value, comment: "Old value"
      t.text :new_value, comment: "New value"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
