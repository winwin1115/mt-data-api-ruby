# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_07_043241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatwork_contacts", force: :cascade do |t|
    t.bigint "contact_id", null: false, comment: "Contact Id"
    t.string "contact_chatwork_id", null: false, comment: "Contact Chatwork Id"
    t.bigint "account_id", null: false, comment: "Chatwork Account Id"
    t.bigint "room_id", comment: "Room Id"
    t.string "name", comment: "Chatwork Name"
    t.string "chatwork_id", comment: "Profile Id"
    t.bigint "organization_id", comment: "Organization Id"
    t.string "organization_name", comment: "Organization Name"
    t.string "department", comment: "Department Name"
    t.string "avatar_image_url", comment: "Avatart Image Url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_files", force: :cascade do |t|
    t.bigint "room_id", null: false, comment: "Room Id"
    t.bigint "file_id", null: false, comment: "File Id"
    t.string "message_id", comment: "Message Id"
    t.string "filesize", comment: "File Size"
    t.string "filename", comment: "File Name"
    t.string "upload_time", comment: "Upload Time"
    t.bigint "account_id", comment: "Account Id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_members", force: :cascade do |t|
    t.bigint "room_id", null: false, comment: "Room Id"
    t.bigint "account_id", null: false, comment: "Chatwork Account Id"
    t.string "role", comment: "Member Role"
    t.string "name", comment: "Member Name"
    t.string "chatwork_id", comment: "Profile Id"
    t.bigint "organization_id", comment: "Organization Id"
    t.string "organization_name", comment: "Organization Name"
    t.string "department", comment: "Department Name"
    t.string "avatar_image_url", comment: "Avatar Image Url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_messages", force: :cascade do |t|
    t.bigint "room_id", null: false, comment: "Room Id"
    t.bigint "message_id", null: false, comment: "Message Id"
    t.bigint "account_id", null: false, comment: "Message sender Id"
    t.text "body", comment: "Message Text"
    t.bigint "send_time", comment: "Message Send Time"
    t.bigint "update_time", comment: "Message Update Time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_myinfos", force: :cascade do |t|
    t.bigint "account_id", null: false, comment: "Chatwork Myaccount Id"
    t.bigint "room_id", comment: "Room Id"
    t.string "name", comment: "Chatwork Name"
    t.string "chatwork_id", comment: "Profile Id"
    t.bigint "organization_id", comment: "Company Id"
    t.string "organization_name", comment: "Comapny Name"
    t.string "department", comment: "Department Name"
    t.string "title", comment: "Title"
    t.string "url", comment: "URL"
    t.text "introduction", comment: "Introduction Text"
    t.string "mail", comment: "Mail address"
    t.string "tel_organization", comment: "Tel Number Organization"
    t.string "tel_extension", comment: "Tel Number Extension"
    t.string "tel_mobile", comment: "Tel Mobile"
    t.string "skype", comment: "Skype Id"
    t.string "facebook", comment: "Facebook Id"
    t.string "twitter", comment: "Twitter Id"
    t.string "avatar_image_url", comment: "Avatar Image Url"
    t.string "login_mail", comment: "Login Email Address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_mystatuses", force: :cascade do |t|
    t.bigint "account_id", null: false, comment: "Chatwork Account Id"
    t.string "chatwork_id", null: false, comment: "Profile Id"
    t.integer "unread_room_num", comment: "Unread Room Number"
    t.integer "mention_room_num", comment: "Mention Room Number"
    t.integer "mytask_room_num", comment: "Mytask Room Number"
    t.integer "unread_num", comment: "Unread Number"
    t.integer "mention_num", comment: "Mention Number"
    t.integer "mytask_num", comment: "Mytask Number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_mytasks", force: :cascade do |t|
    t.bigint "account_id", null: false, comment: "Chatwork Account Id"
    t.string "chatwork_id", null: false, comment: "Profile Id"
    t.bigint "task_id", comment: "Task Id"
    t.bigint "room_id", comment: "Room Id"
    t.bigint "assigner_id", comment: "Assigner Id"
    t.string "message_id", comment: "Message Id"
    t.text "body", comment: "Task Body"
    t.string "limit_time", comment: "Limit Time"
    t.string "status", comment: "Task Status"
    t.string "limit_type", comment: "Task Type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_requests", force: :cascade do |t|
    t.bigint "account_id", null: false, comment: "Chatwork Account Id"
    t.bigint "request_id", null: false, comment: "Incoming Request Id"
    t.bigint "sender_id", comment: "Sender Account Id"
    t.text "message", comment: "Message Body"
    t.string "name", comment: "Sender Name"
    t.string "chatwork_id", comment: "Chatwork Id"
    t.bigint "organization_id", comment: "Organization Id"
    t.string "organization_name", comment: "Organization Name"
    t.string "department", comment: "Department Name"
    t.string "avatar_image_url", comment: "Avatar Image Url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_rooms", force: :cascade do |t|
    t.bigint "account_id", null: false, comment: "Chatwork Account Id"
    t.string "chatwork_id", null: false, comment: "Profile Id"
    t.bigint "room_id", null: false, comment: "Room Id"
    t.string "name", comment: "Customer Name"
    t.string "room_type", comment: "Room Type"
    t.string "role", comment: "Role Name"
    t.boolean "sticky", comment: "Sticky"
    t.integer "unread_num", comment: "Unread Number"
    t.integer "mention_num", comment: "Mention Number"
    t.integer "mytask_num", comment: "MyTask Number"
    t.integer "message_num", comment: "Message Number"
    t.integer "file_num", comment: "File Number"
    t.integer "task_num", comment: "Task Number"
    t.string "icon_path", comment: "Avatar Image Url"
    t.bigint "last_update_time", comment: "Last Updated Time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chatwork_tasks", force: :cascade do |t|
    t.bigint "room_id", null: false, comment: "Room Id"
    t.bigint "task_id", null: false, comment: "Task Id"
    t.bigint "account_id", comment: "Task Account Id"
    t.bigint "assigner_id", comment: "Assigner Id"
    t.string "message_id", comment: "Message Id"
    t.text "body", comment: "Task Body"
    t.string "limit_time", comment: "Limit Time"
    t.string "status", comment: "Task Status"
    t.string "limit_type", comment: "Task Type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log"
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "github_commits", force: :cascade do |t|
    t.string "login", null: false, comment: "Github User Name"
    t.string "sha", comment: "Sha"
    t.string "node_id", comment: "Node Id"
    t.string "commit_author_name", comment: "Commit Author Name"
    t.date "commit_author_date", comment: "Commit Author Date"
    t.string "commit_message", comment: "Commit Message"
    t.string "url", comment: "Commit Url"
    t.string "comment_count", comment: "Comment Count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "github_issues", force: :cascade do |t|
    t.string "login", null: false, comment: "Github User Name"
    t.string "url", comment: "Issues Url"
    t.string "repository_url", comment: "Repository Url"
    t.string "labels_url", comment: "Labels Url"
    t.string "comments_url", comment: "Comments Url"
    t.string "events_url", comment: "Events Url"
    t.string "html_url", comment: "HTML Url"
    t.string "issue_id", comment: "Issue Id"
    t.string "node_id", comment: "Node Id"
    t.string "number", comment: "Number"
    t.string "title", comment: "Title"
    t.string "writer_id", comment: "Writer Id"
    t.string "labels", comment: "Labels"
    t.string "state", comment: "State"
    t.boolean "locked", comment: "Locked Status"
    t.string "assingee", comment: "Assignee"
    t.string "milestones", comment: "MileStones"
    t.string "comments", comment: "Comments"
    t.date "create_time", comment: "Create Date"
    t.date "update_time", comment: "Update Date"
    t.date "close_time", comment: "Close Date"
    t.string "author_association", comment: "Author Association"
    t.string "active_lock_reason", comment: "Active Lock Reason"
    t.string "body", comment: "Body"
    t.string "timeline_url", comment: "TimeLine Url"
    t.string "performed_via_github_app", comment: "Performed via Github App"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "github_orgs", force: :cascade do |t|
    t.string "login", null: false, comment: "Github Organizations Name"
    t.string "orgs_id", comment: "Organizations Id"
    t.string "node_id"
    t.string "url"
    t.string "repos_url"
    t.string "events_url"
    t.string "hooks_url"
    t.string "issues_url"
    t.string "members_url"
    t.string "public_members_url"
    t.string "avatar_url"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "github_repositories", force: :cascade do |t|
    t.string "login", null: false, comment: "Github User Name"
    t.string "repository_id", comment: "Github Repository Id"
    t.string "node_id", comment: "Node Id"
    t.string "name", comment: "Repository Name"
    t.string "full_name", comment: "Full Name"
    t.boolean "private", comment: "Private Or Public"
    t.string "owner_id", comment: "Owner Id"
    t.string "html_url", comment: "HTML Url"
    t.text "description", comment: "Description"
    t.boolean "fork", comment: "Fork"
    t.string "url", comment: "Url"
    t.string "forks_url", comment: "Forks Url"
    t.string "keys_url", comment: "Keys Url"
    t.string "collaborators_url", comment: "Collaborators Url"
    t.string "teams_url", comment: "Teams Url"
    t.string "hooks_url", comment: "Hooks Url"
    t.string "issue_events_url"
    t.string "events_url"
    t.string "assignees_url"
    t.string "branches_url"
    t.string "tags_url"
    t.string "blobs_url"
    t.string "git_tags_url"
    t.string "git_refs_url"
    t.string "trees_url"
    t.string "statuses_url"
    t.string "languages_url"
    t.string "stargazers_url"
    t.string "contributors_url"
    t.string "subscribers_url"
    t.string "subscription_url"
    t.string "commits_url"
    t.string "issue_comment_url"
    t.string "contents_url"
    t.string "compare_url"
    t.string "merges_url"
    t.string "archive_url"
    t.string "downloads_url"
    t.string "issues_url"
    t.string "pulls_url"
    t.string "milestones_url"
    t.string "notifications_url"
    t.string "labels_url"
    t.string "releases_url"
    t.string "deployments_url"
    t.date "create_time"
    t.date "update_time"
    t.date "push_time"
    t.string "git_url"
    t.string "ssh_url"
    t.string "clone_url"
    t.string "svn_url"
    t.string "homepage"
    t.string "size"
    t.string "stargazers_count"
    t.string "watchers_count"
    t.string "language"
    t.boolean "has_issues"
    t.boolean "has_projects"
    t.boolean "has_downloads"
    t.boolean "has_wiki"
    t.boolean "has_pages"
    t.string "forks_count"
    t.string "mirror_url"
    t.boolean "archived"
    t.boolean "disabled"
    t.string "open_issues_count"
    t.string "license_key"
    t.string "license_name"
    t.string "license_spdx_id"
    t.string "license_url"
    t.string "license_node_id"
    t.boolean "allow_forking"
    t.boolean "is_template"
    t.string "visibility"
    t.string "forks"
    t.string "open_issues"
    t.string "watchers"
    t.string "default_branch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "github_users", force: :cascade do |t|
    t.string "login", null: false, comment: "Github User Name"
    t.integer "github_id", null: false, comment: "Github User Id"
    t.string "node_id", null: false, comment: "Github Node Id"
    t.string "avatar_url", comment: "Github Avatar Url"
    t.string "gravatar_id", comment: "Gravatar Id"
    t.string "url", null: false, comment: "Github Rest API URL"
    t.string "html_url", null: false, comment: "Github URL"
    t.string "followers_url", comment: "Followers URL"
    t.string "following_url", comment: "Following URL"
    t.string "gists_url", comment: "Gists URL"
    t.string "starred_url", comment: "Starred URL"
    t.string "subscriptions_url", comment: "Subscriptions URL"
    t.string "organizations_url", comment: "Organizations URL"
    t.string "repos_url", comment: "Repositories URL"
    t.string "events_url", comment: "Events URL"
    t.string "received_events_url", comment: "Received Events URL"
    t.string "type", null: false, comment: "User Type"
    t.boolean "site_admin", comment: "Site Admin Status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "github_users_baseinfos", force: :cascade do |t|
    t.string "login", null: false, comment: "Github User Name"
    t.string "name", comment: "User Name"
    t.string "company", comment: "User Company"
    t.string "blog", comment: "Blog"
    t.string "location", comment: "User Location"
    t.string "email", comment: "User Email"
    t.boolean "hireable", comment: "Hireable Status"
    t.string "bio", comment: "User Biography"
    t.string "twitter_username", comment: "User Twitter Name"
    t.integer "public_repos", comment: "Public Repository Count"
    t.integer "public_gists", comment: "Public Gists Count"
    t.integer "followers", comment: "Follower Count"
    t.integer "following", comment: "Following Count"
    t.date "create_time", comment: "User Create Date"
    t.date "update_time", comment: "User Update Date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_attachments", force: :cascade do |t|
    t.bigint "attachment_id", null: false, comment: "Attachment Id"
    t.integer "container_id", comment: "Container Id"
    t.string "container_type", comment: "Container Type"
    t.string "filename", comment: "File Name"
    t.string "description", comment: "Description"
    t.string "disk_filename", comment: "Disk FileName"
    t.string "disk_directory", comment: "Disk Directory"
    t.integer "filesize", comment: "File Size"
    t.string "content_type", comment: "Content Type"
    t.string "content_url", comment: "Content Url"
    t.string "digest", comment: "Digest"
    t.integer "downloads", comment: "Downloads"
    t.integer "author_id", comment: "Author Id"
    t.datetime "created_on", comment: "Attachment Created Time"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_changesets", force: :cascade do |t|
    t.bigint "issue_id", null: false, comment: "Issue Id"
    t.integer "repository_id", comment: "Repository Id"
    t.string "revision", comment: "Revision"
    t.bigint "user_id", comment: "User Id"
    t.string "committer", comment: "Committer"
    t.datetime "committed_on", comment: "Committed Time"
    t.date "commit_date"
    t.text "comments", comment: "Comments"
    t.string "scmid"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_custom_fields", force: :cascade do |t|
    t.bigint "custom_field_id", null: false, comment: "Custom Field Id"
    t.string "type", comment: "Customized Type"
    t.string "name", comment: "Custom Field Name"
    t.string "field_format", comment: "Field Format"
    t.text "possible_values", comment: "Possible Values"
    t.string "regexp", comment: "Regular Expression"
    t.integer "min_length", comment: "Min Length"
    t.integer "max_length", comment: "Max Length"
    t.boolean "is_required", comment: "Is Required"
    t.boolean "is_filter", comment: "Is Filter"
    t.boolean "is_for_all", comment: "Is For All"
    t.integer "position", comment: "Position"
    t.boolean "searchable"
    t.text "default_value"
    t.boolean "editable"
    t.boolean "visible"
    t.boolean "multiple"
    t.text "format_store"
    t.text "description"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_enumerations", force: :cascade do |t|
    t.bigint "enumeration_id", null: false, comment: "Enumeration Id"
    t.string "name", null: false, comment: "Enumeration Name"
    t.integer "position", comment: "Position"
    t.boolean "is_default", comment: "Default Status"
    t.string "enumeration_type", comment: "Enumeration Type"
    t.boolean "active", comment: "Active Status"
    t.bigint "project_id", comment: "Project Id"
    t.bigint "parent_id", comment: "Parent Id"
    t.string "position_name", comment: "Position Name"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_groups", force: :cascade do |t|
    t.bigint "group_id", null: false, comment: "Group Id"
    t.string "name", null: false, comment: "Group Name"
    t.bigint "user_id", comment: "User Id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_issue_categories", force: :cascade do |t|
    t.bigint "issue_category_id", null: false, comment: "Issue Category Id"
    t.bigint "project_id", comment: "Project Id"
    t.string "name", comment: "Issue Category Name"
    t.integer "assigned_to_id", comment: "Issue Assigned User Id"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_issue_relations", force: :cascade do |t|
    t.bigint "issue_relation_id", null: false, comment: "Issue Relation Id"
    t.bigint "issue_from_id", null: false, comment: "Issue From Id"
    t.bigint "issue_to_id", null: false, comment: "Issue To Id"
    t.string "relation_type", comment: "Relation Type"
    t.integer "delay", comment: "Delay"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_issue_statuses", force: :cascade do |t|
    t.bigint "issue_status_id", null: false, comment: "Issue Status Id"
    t.string "name", null: false, comment: "Issue Status Name"
    t.boolean "is_closed", comment: "Open or Closed"
    t.boolean "is_default", comment: "Default or not"
    t.integer "position", comment: "Position"
    t.string "html_color", comment: "HTML Color"
    t.integer "default_done_ratio", comment: "Default Done Ratio"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_issues", force: :cascade do |t|
    t.bigint "issue_id", null: false, comment: "Issue Id"
    t.bigint "project_id", null: false, comment: "Project Id"
    t.bigint "tracker_id", null: false, comment: "Tracker Id"
    t.bigint "status_id", null: false, comment: "Status Id"
    t.bigint "priority_id", null: false, comment: "Priority Id"
    t.string "subject", null: false, comment: "Issue Subject"
    t.text "description", comment: "Issue Description"
    t.bigint "category_id", comment: "Category Id"
    t.bigint "assigned_to_id"
    t.bigint "author_id"
    t.boolean "is_private"
    t.integer "estimated_hours"
    t.date "start_date"
    t.date "due_date"
    t.integer "done_ratio"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_journal_details", force: :cascade do |t|
    t.bigint "journal_id", null: false, comment: "Journal Id"
    t.string "property", null: false, comment: "Property"
    t.string "name", comment: "Journal Name"
    t.string "prop_key", comment: "Prop Key"
    t.text "old_value", comment: "Old value"
    t.text "new_value", comment: "New value"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_journals", force: :cascade do |t|
    t.bigint "journalized_id", null: false, comment: "Journals Id"
    t.string "journalized_type", comment: "Journals Type"
    t.bigint "user_id", comment: "User Id"
    t.text "notes", comment: "Journal Notes"
    t.boolean "private_notes"
    t.datetime "created_on", comment: "Journal Created Time"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_memberships", force: :cascade do |t|
    t.bigint "membership_id", null: false, comment: "Membership Id"
    t.bigint "project_id", null: false, comment: "Project Id"
    t.bigint "user_id", null: false, comment: "User Id"
    t.string "role_id", null: false, comment: "Role Id(multiple)"
    t.datetime "created_on", comment: "Membership created Time"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_news", force: :cascade do |t|
    t.bigint "news_id", null: false, comment: "News Id"
    t.bigint "project_id", null: false, comment: "Project Id"
    t.bigint "author_id"
    t.string "title", null: false, comment: "News Title"
    t.string "summary", comment: "News summary"
    t.text "description", comment: "News description"
    t.integer "comments_count"
    t.datetime "created_on"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_projects", force: :cascade do |t|
    t.bigint "project_id", null: false, comment: "Project Id"
    t.string "name", null: false, comment: "Project Name"
    t.string "identifier", comment: "Project Identifier"
    t.text "description", comment: "Project Description"
    t.integer "status", comment: "Project Status"
    t.string "homepage", comment: "Project Homepage"
    t.boolean "is_public", comment: "Public or Private"
    t.boolean "inherit_members", comment: "Inherit Members"
    t.bigint "parent_id", comment: "Project Parent Id"
    t.datetime "created_on", comment: "Created Time"
    t.datetime "updated_on", comment: "Updated Time"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_queries", force: :cascade do |t|
    t.bigint "query_id", null: false, comment: "Query Id"
    t.bigint "project_id", comment: "Project Id"
    t.string "name"
    t.text "filters"
    t.bigint "user_id"
    t.boolean "is_public"
    t.text "column_names"
    t.text "sort_criteria"
    t.string "group_by"
    t.string "type"
    t.integer "visibility"
    t.text "options"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_repositories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_roles", force: :cascade do |t|
    t.bigint "role_id", null: false, comment: "Role Id"
    t.string "name", comment: "Role Name"
    t.integer "position", comment: "Position"
    t.boolean "assignable"
    t.integer "builtin"
    t.text "permissions"
    t.string "issues_visibility"
    t.string "users_visibility"
    t.string "time_entries_visibility"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_time_entries", force: :cascade do |t|
    t.bigint "time_entry_id", null: false, comment: "Time Entry Id"
    t.bigint "project_id", null: false, comment: "Project Id"
    t.bigint "user_id", null: false, comment: "User Id"
    t.bigint "issue_id", comment: "Issue Id"
    t.float "hours", comment: "Hours"
    t.string "comments"
    t.integer "activity_id"
    t.datetime "spent_on"
    t.integer "tyear"
    t.integer "tmonth"
    t.integer "tweek"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_tokens", force: :cascade do |t|
    t.bigint "token_id", null: false, comment: "Token Id"
    t.bigint "user_id", null: false, comment: "User Id"
    t.string "action", comment: "Action"
    t.string "value", comment: "Token Value"
    t.datetime "created_on", comment: "Token Created Time"
    t.datetime "updated_on", comment: "Token Updated Time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_trackers", force: :cascade do |t|
    t.bigint "tracker_id", null: false, comment: "Tracker Id"
    t.string "name", comment: "Tracker Name"
    t.integer "field_bits"
    t.boolean "is_in_roadmap"
    t.integer "position"
    t.integer "default_status_id", comment: "Default Status Id"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_users", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "User id"
    t.string "login", null: false, comment: "Login Id"
    t.boolean "admin", null: false, comment: "Admin or User"
    t.string "firstname", null: false, comment: "First Name"
    t.string "lastname", null: false, comment: "Last Name"
    t.string "mail", comment: "Mail address"
    t.boolean "mail_notification", comment: "Mail Notification"
    t.integer "status", comment: "User Status"
    t.datetime "last_login_on", comment: "Last Login Time"
    t.string "language", comment: "Language"
    t.integer "auth_source_id"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "redmine_versions", force: :cascade do |t|
    t.bigint "version_id", null: false, comment: "Version Id"
    t.bigint "project_id", null: false, comment: "Project Id"
    t.string "name"
    t.string "description"
    t.string "status"
    t.string "sharing"
    t.date "due_date"
    t.string "wiki_page_title"
    t.date "effective_date"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.string "data_type", comment: "All or Person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
