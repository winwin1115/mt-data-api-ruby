class CreateGithubUsersBaseinfos < ActiveRecord::Migration[6.1]
  def change
    create_table :github_users_baseinfos do |t|
      t.string :login, null: false, comment: "Github User Name"
      t.string :name, comment: "User Name"
      t.string :company, comment: "User Company"
      t.string :blog, comment: "Blog"
      t.string :location, comment: "User Location"
      t.string :email, comment: "User Email"
      t.boolean :hireable, comment: "Hireable Status"
      t.string :bio, comment: "User Biography"
      t.string :twitter_username, comment: "User Twitter Name"
      t.integer :public_repos, comment: "Public Repository Count"
      t.integer :public_gists, comment: "Public Gists Count"
      t.integer :followers, comment: "Follower Count"
      t.integer :following, comment: "Following Count"
      t.date :create_time, comment: "User Create Date"
      t.date :update_time, comment: "User Update Date"
      t.timestamps
    end
  end
end
