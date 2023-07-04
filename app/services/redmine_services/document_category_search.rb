class RedmineServices::DocumentCategorySearch < ApplicationService
  def call
    RedmineDocumentCategorySearchJob.perform_now
  end
end