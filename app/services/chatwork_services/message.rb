class ChatworkServices::Message < ApplicationService
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def call
    ChatworkMessageJob.perform_now(@key)
  end
end