class CreateGithubOrgs < ActiveRecord::Migration[6.1]
  def change
    create_table :github_orgs do |t|
      t.string :login, null: false, comment: "Github Organizations Name"
      t.string :orgs_id, comment: "Organizations Id"
      t.string :node_id
      t.string :url
      t.string :repos_url
      t.string :events_url
      t.string :hooks_url
      t.string :issues_url
      t.string :members_url
      t.string :public_members_url
      t.string :avatar_url
      t.text :description
      t.timestamps
    end
  end
end
