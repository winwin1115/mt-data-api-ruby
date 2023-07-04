class ChatworkServices::Search < ApplicationService
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def call
    ChatworkMyinfoJob.perform_now(@key)
  end
end