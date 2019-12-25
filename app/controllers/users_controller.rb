class UsersController < ApplicationController
  skip_before_action :authenticate_user! only: :create

  def create
    perform User::CreateAction do
      return render json: @action.records
    end
    render_action_error @action
  end

end
