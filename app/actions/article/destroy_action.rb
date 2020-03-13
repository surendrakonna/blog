# frozen_string_literal: true

class Article::DestroyAction < Article::BaseAction

  def perform
    record&.destroy
  end

end
