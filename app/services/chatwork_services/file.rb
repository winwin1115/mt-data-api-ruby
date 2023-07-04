class ChatworkServices::File < ApplicationService
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def call
    ChatworkFileJob.perform_now(@key)
  end
end