class RedmineIssueRelateSearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    issueArray = RedmineIssue.where(data_type: 'all').limit(200).order(:id)
    if issueArray.length
      issueArray.each do |issue|
        result = []
        base_url = "https://www.redmine.org"

        url = "#{base_url}/issues/#{issue['issue_id']}.json?include=changesets,attachments,journals,relations"
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        res = http.get(uri)
        temp = JSON.parse(res.body)
        result = temp['issue']

        if !result['relations'].nil?
          relations = result['relations']
          relations.each do |relation|
            begin
              redmine_issue_relation = RedmineIssueRelation.new(
                issue_relation_id: relation['id'],
                issue_from_id: relation['issue_id'],
                issue_to_id: relation['issue_to_id'],
                relation_type: relation['relation_type'],
                delay: relation['delay'],
                data_type: 'all'
              )
              redmine_issue_relation.save
            rescue => e
              flag = true
            end
          end
        end

        if !result['custom_fields'].nil?
          custom_fields = result['custom_fields']
          custom_fields.each do |custom_field|
            begin
              redmine_custom_field = RedmineCustomField.new(
                custom_field_id: custom_field['id'],
                name: custom_field['name'],
                default_value: custom_field['value'],
                data_type: 'all'
              )
              redmine_custom_field.save
            rescue => e
              flag = true
            end
          end
        end

        if !result['changesets'].nil?
          changesets = result['changesets']
          changesets.each do |changeset|
            if changeset['user'].nil?
              user_id = nil
            else
              user_id = changeset['user']['id']
            end
            begin
              redmine_changeset = RedmineChangeset.new(
                issue_id: result['id'],
                revision: changeset['revision'],
                user_id: user_id,
                comments: changeset['comments'],
                committed_on: changeset['committed_on'],
                data_type: 'all'
              )
              redmine_changeset.save
            rescue => e
              flag = true
            end
          end
        end

        if !result['attachments'].nil?
          attachments = result['attachments']
          attachments.each do |attachment|
            if attachment['author'].nil?
              author_id = nil
            else
              author_id = attachment['author']['id']
            end
            begin
              redmine_attachment = RedmineAttachment.new(
                attachment_id: attachment['id'],
                filename: attachment['filename'],
                filesize: attachment['filesize'],
                content_type: attachment['content_type'],
                description: attachment['description'],
                content_url: attachment['content_url'],
                author_id: author_id,
                created_on: attachment['created_on'],
                data_type: 'all'
              )
              redmine_attachment.save
            rescue => e
              flag = true
            end
          end
        end

        if !result['journals'].nil?
          journals = result['journals']
          journals.each do |journal|
            if journal['user'].nil?
              user_id = nil
            else
              user_id = journal['user']['id']
            end
            begin
              redmine_journal = RedmineJournal.new(
                journalized_id: journal['id'],
                user_id: user_id,
                notes: journal['notes'],
                created_on: journal['created_on'],
                data_type: 'all'
              )
              redmine_journal.save

              if !journal['details'].nil?
                journal_detail = journal['details']

                journal_detail.each do |detail|
                  redmine_journal_detail = RedmineJournalDetail.new(
                    journal_id: journal['id'],
                    property: journal_detail['property'],
                    name: journal_detail['name'],
                    old_value: journal_detail['old_value'],
                    new_value: journal_detail['new_value'],
                    data_type: 'all'
                  )
                  redmine_journal_detail.save
                end
              end
            rescue => e
              flag = true
            end
          end
        end
      end
    end
  end
end
