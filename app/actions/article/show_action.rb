# frozen_string_literal: true

class Article::ShowAction < Article::BaseAction
  def perform
    record&.present?
  end
end
