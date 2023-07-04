class CreateRedmineAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_attachments do |t|
      t.bigint :attachment_id, null: false, comment: "Attachment Id"
      t.integer :container_id, comment: "Container Id"
      t.string :container_type, comment: "Container Type"
      t.string :filename, comment: "File Name"
      t.string :description, comment: "Description"
      t.string :disk_filename, comment: "Disk FileName"
      t.string :disk_directory, comment: "Disk Directory"
      t.integer :filesize, comment: "File Size"
      t.string :content_type, comment: "Content Type"
      t.string :content_url, comment: "Content Url"
      t.string :digest, comment: "Digest"
      t.integer :downloads, comment: "Downloads"
      t.integer :author_id, comment: "Author Id"
      t.datetime :created_on, comment: "Attachment Created Time"
      t.string :data_type, comment: "All or Person"
      t.timestamps
    end
  end
end
