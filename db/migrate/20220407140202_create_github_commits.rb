class CreateGithubCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :github_commits do |t|
      t.string :login, null: false, comment: "Github User Name"
      t.string :sha, comment: "Sha"
      t.string :node_id, comment: "Node Id"
      t.string :commit_author_name, comment: "Commit Author Name"
      t.date :commit_author_date, comment: "Commit Author Date"
      t.string :commit_message, comment: "Commit Message"
      t.string :url, comment: "Commit Url"
      t.string :comment_count, comment: "Comment Count"
      t.timestamps
    end
  end
end
