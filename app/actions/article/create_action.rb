# frozen_string_literal: true

class Article::CreateAction < Article::BaseAction

  def record
    @record ||= Article.new(permitted_params.merge(author: current_user))
  end

end
