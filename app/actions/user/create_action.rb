# frozen_string_literal: true

class User::CreateAction < User::BaseAction

  def record
    @record ||= User.new(permitted_params)
  end

  def authorize!
    true
  end

end
