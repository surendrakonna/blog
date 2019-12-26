class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    perform User::CreateAction do
      return render json: @action.record
    end
    render_action_error @action
  end

end
