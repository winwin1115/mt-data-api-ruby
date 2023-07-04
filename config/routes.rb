Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :github do
        get 'start', to: 'users#getStart'
        get 'totalUser', to: 'users#getTotal'

        get 'users', to: 'users#index'
        get 'users/:user', to: 'users#show'
        get 'user-baseinfo', to: 'users#getUserBaseInfo'

        get 'issues', to: 'issues#getIssues'
        get 'commits', to: 'commits#getCommits'
        get 'repositorys', to: 'repositorys#getRepositorys'
        get 'orgs', to: 'orgs#getOrgs'
      end

      namespace :chatwork do
        get 'getInfo', to: 'my#getStart'
        get 'getMessage', to: 'my#getMessage'
        get 'getFile', to: 'my#getFile'

        get 'users', to: 'my#index'
        get 'users/:user', to: 'my#show'
        get 'mytasks/:user', to: 'task#show'
        get 'contacts/:user', to: 'contact#show'
        get 'rooms/:user', to: 'room#show'
        get 'members/:room_id', to: 'room#getMember'
        get 'messages/:room_id', to: 'room#getMessage'
        get 'messages/:room_id/one/:message_id', to: 'room#oneMessage'
        get 'tasks/:room_id', to: 'room#getTask'
        get 'tasks/:room_id/one/:task_id', to: 'room#oneTask'
        get 'files/:room_id', to: 'room#getFile'
        get 'files/:room_id/one/:file_id', to: 'room#oneFile'
        get 'requests', to: 'request#index'
        get 'requests/:user', to: 'request#show'
      end

      namespace :redmine do
        get 'getAllIssue', to: 'issue#getAllIssue'
        get 'getIssue', to: 'issue#getIssue'
        get 'getAllProject', to: 'project#getAllProject'
        get 'getAllNews', to: 'news#getAllNews'
        get 'getAllTracker', to: 'tracker#getAllTracker'
        get 'getAllIssueRelate', to: 'issue_relate#getAllIssueRelate'
        get 'getAllQuery', to: 'query#getAllQuery'
        get 'getAllProjectRelate', to: 'project_relate#getAllProjectRelate'
        get 'getAllMembership', to: 'membership#getAllMembership'
        get 'getAllIssueStatus', to: 'issue#getAllIssueStatus'
        get 'getAllRole', to: 'role#getAllRole'
        get 'getAllEnumeration', to: 'enumeration#getAllEnumeration'
        get 'getAllVersion', to: 'version#getAllVersion'

        get 'issues', to: 'issue#index'
        get 'issues/:issue_id', to: 'issue#show'
        get 'projects', to: 'project#index'
        get 'projects/:project_id', to: 'project#show'
        get 'attachments', to: 'issue_relate#getAttachment'
        get 'attachments/:attachment_id', to: 'issue_relate#oneAttachment'
        get 'changesets', to: 'issue_relate#getChangeset'
        get 'changesets/:issue_id', to: 'issue_relate#oneChangeset'
        get 'custom_fields', to: 'issue_relate#getCustomField'
        get 'custom_fields/:custom_id', to: 'issue_relate#oneCustomField'
        get 'issue_priorities', to: 'enumeration#getIssuePriority'
        get 'issue_priorities/:enumeration_id', to: 'enumeration#oneIssuePriority'
        get 'time_entry_activities', to: 'enumeration#getTimeEntryActivity'
        get 'time_entry_activities/:enumeration_id', to: 'enumeration#oneTimeEntryActivity'
        get 'document_categories', to: 'enumeration#getDocumentCategory'
        get 'document_categories/:enumeration_id', to: 'enumeration#oneDocumentCategory'
        get 'issue_categories', to: 'issue_relate#getIssueCategory'
        get 'issue_categories/:category_id', to: 'issue_relate#oneIssueCategory'
        get 'issue_relations', to: 'issue_relate#getIssueRelation'
        get 'issue_relations/:relation_id', to: 'issue_relate#oneIssueRelation'
        get 'issue_statuses', to: 'issue#getIssueStatus'
        get 'issue_statuses/:status_id', to: 'issue#oneIssueStatus'
        get 'journals', to: 'issue_relate#getJournal'
        get 'journals/:journal_id', to: 'issue_relate#oneJournal'
        get 'memberships', to: 'membership#index'
        get 'memberships/:project_id', to: 'membership#show'
        get 'news', to: 'news#index'
        get 'news/:news_id', to: 'news#show'
        get 'queries', to: 'query#index'
        get 'queries/:query_id', to: 'query#show'
        get 'roles', to: 'role#index'
        get 'roles/:role_id', to: 'role#show'
        get 'trackers', to: 'tracker#index'
        get 'trackers/:tracker_id', to: 'tracker#show'
        get 'versions', to: 'version#index'
        get 'versions/:version_id', to: 'version#show'
      end
    end
  end
end
