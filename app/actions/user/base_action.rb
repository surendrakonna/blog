# frozen_string_literal: true

class User::BaseAction < Abstract::BaseAction

  def record
    @record ||= User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    fail_with_error(404, :user, e.message)
  end

  def permitted_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
