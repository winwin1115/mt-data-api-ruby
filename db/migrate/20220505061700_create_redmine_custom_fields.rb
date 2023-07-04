class CreateRedmineCustomFields < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_custom_fields do |t|
      t.bigint :custom_field_id, null: false, comment: "Custom Field Id"
      t.string :type, comment: "Customized Type"
      t.string :name, comment: "Custom Field Name"
      t.string :field_format, comment: "Field Format"
      t.text :possible_values, comment: "Possible Values"
      t.string :regexp, comment: "Regular Expression"
      t.integer :min_length, comment: "Min Length"
      t.integer :max_length, comment: "Max Length"
      t.boolean :is_required, comment: "Is Required"
      t.boolean :is_filter, comment: "Is Filter"
      t.boolean :is_for_all, comment: "Is For All"
      t.integer :position, comment: "Position"
      t.boolean :searchable
      t.text :default_value
      t.boolean :editable
      t.boolean :visible
      t.boolean :multiple
      t.text :format_store
      t.text :description
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
