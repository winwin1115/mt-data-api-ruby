class CreateRedmineTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_trackers do |t|
      t.bigint :tracker_id, null: false, comment: "Tracker Id"
      t.string :name, comment: "Tracker Name"
      t.integer :field_bits
      t.boolean :is_in_roadmap
      t.integer :position
      t.integer :default_status_id, comment: "Default Status Id"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
