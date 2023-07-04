class CreateGithubUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :github_users do |t|
      t.string :login, null: false, comment: "Github User Name"
      t.integer :github_id, null: false, comment: "Github User Id"
      t.string :node_id, null: false, comment: "Github Node Id"
      t.string :avatar_url, comment: "Github Avatar Url"
      t.string :gravatar_id, comment: "Gravatar Id"
      t.string :url, null: false, comment: "Github Rest API URL"
      t.string :html_url, null: false, comment: "Github URL"
      t.string :followers_url, comment: "Followers URL"
      t.string :following_url, comment: "Following URL"
      t.string :gists_url, comment: "Gists URL"
      t.string :starred_url, comment: "Starred URL"
      t.string :subscriptions_url, comment: "Subscriptions URL"
      t.string :organizations_url, comment: "Organizations URL"
      t.string :repos_url, comment: "Repositories URL"
      t.string :events_url, comment: "Events URL"
      t.string :received_events_url, comment: "Received Events URL"
      t.string :type, null: false, comment: "User Type"
      t.boolean :site_admin, comment: "Site Admin Status"
      t.timestamps
    end
  end
end
