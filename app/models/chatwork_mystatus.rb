class ChatworkMystatus < ApplicationRecord
  validates :account_id, :presence => true, :uniqueness => true
  validates :chatwork_id, :presence => true, :uniqueness => true
end
