# frozen_string_literal: true

module Authentication
  def authenticate_user!
    render json: { error: I18n.t('unauthorized') }, status: :unauthorized unless current_user
  end

  def current_user
    return nil unless access_token

    @current_user ||= User.find_by(authentication_token: access_token)
  end

  def access_token
    @access_token ||= request.headers['X-ACCESS-TOKEN']
  end
end
