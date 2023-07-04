class CreateGithubRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :github_repositories do |t|
      t.string :login, null: false, comment: "Github User Name"
      t.string :repository_id, comment: "Github Repository Id"
      t.string :node_id, comment: "Node Id"
      t.string :name, comment: "Repository Name"
      t.string :full_name, comment: "Full Name"
      t.boolean :private, comment: "Private Or Public"
      t.string :owner_id, comment: "Owner Id"
      t.string :html_url, comment: "HTML Url"
      t.text :description, comment: "Description"
      t.boolean :fork, comment: "Fork"
      t.string :url, comment: "Url"
      t.string :forks_url, comment: "Forks Url"
      t.string :keys_url, comment: "Keys Url"
      t.string :collaborators_url, comment: "Collaborators Url"
      t.string :teams_url, comment: "Teams Url"
      t.string :hooks_url, comment: "Hooks Url"
      t.string :issue_events_url
      t.string :events_url
      t.string :assignees_url
      t.string :branches_url
      t.string :tags_url
      t.string :blobs_url
      t.string :git_tags_url
      t.string :git_refs_url
      t.string :trees_url
      t.string :statuses_url
      t.string :languages_url
      t.string :stargazers_url
      t.string :contributors_url
      t.string :subscribers_url
      t.string :subscription_url
      t.string :commits_url
      t.string :issue_comment_url
      t.string :contents_url
      t.string :compare_url
      t.string :merges_url
      t.string :archive_url
      t.string :downloads_url
      t.string :issues_url
      t.string :pulls_url
      t.string :milestones_url
      t.string :notifications_url
      t.string :labels_url
      t.string :releases_url
      t.string :deployments_url
      t.date :create_time
      t.date :update_time
      t.date :push_time
      t.string :git_url
      t.string :ssh_url
      t.string :clone_url
      t.string :svn_url
      t.string :homepage
      t.string :size
      t.string :stargazers_count
      t.string :watchers_count
      t.string :language
      t.boolean :has_issues
      t.boolean :has_projects
      t.boolean :has_downloads
      t.boolean :has_wiki
      t.boolean :has_pages
      t.string :forks_count
      t.string :mirror_url
      t.boolean :archived
      t.boolean :disabled
      t.string :open_issues_count
      t.string :license_key
      t.string :license_name
      t.string :license_spdx_id
      t.string :license_url
      t.string :license_node_id
      t.boolean :allow_forking
      t.boolean :is_template
      t.string :visibility
      t.string :forks
      t.string :open_issues
      t.string :watchers
      t.string :default_branch
      t.timestamps
    end
  end
end
