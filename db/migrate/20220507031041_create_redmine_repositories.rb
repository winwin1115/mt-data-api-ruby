class CreateRedmineRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :redmine_repositories do |t|

      t.timestamps
    end
  end
end
