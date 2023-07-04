class CreateGithubIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :github_issues do |t|
      t.string :login, null: false, comment: "Github User Name"
      t.string :url, comment: "Issues Url"
      t.string :repository_url, comment: "Repository Url"
      t.string :labels_url, comment: "Labels Url"
      t.string :comments_url, comment: "Comments Url"
      t.string :events_url, comment: "Events Url"
      t.string :html_url, comment: "HTML Url"
      t.string :issue_id, comment: "Issue Id"
      t.string :node_id, comment: "Node Id"
      t.string :number, comment: "Number"
      t.string :title, comment: "Title"
      t.string :writer_id, comment: "Writer Id"
      t.string :labels, comment: "Labels"
      t.string :state, comment: "State"
      t.boolean :locked, comment: "Locked Status"
      t.string :assingee, comment: "Assignee"
      t.string :milestones, comment: "MileStones"
      t.string :comments, comment: "Comments"
      t.date :create_time, comment: "Create Date"
      t.date :update_time, comment: "Update Date"
      t.date :close_time, comment: "Close Date"
      t.string :author_association, comment: "Author Association"
      t.string :active_lock_reason, comment: "Active Lock Reason"
      t.string :body, comment: "Body"
      t.string :timeline_url, comment: "TimeLine Url"
      t.string :performed_via_github_app, comment: "Performed via Github App"
      t.timestamps
    end
  end
end
