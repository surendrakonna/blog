# frozen_string_literal: true

class Article::BaseAction < Abstract::BaseAction

  def authorize!
    # TODO must be auther of article
    true
  end

  def record
    @record ||= Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    fail_with_error(404, :user, e.message)
  end

  def permitted_params
    params.require(:article).permit(:title, :description, :state)
  end
end
