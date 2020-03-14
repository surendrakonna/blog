class Api::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :show]

  def create
    perform User::CreateAction do
      return render json: @action.record
    end
    render_action_error @action
  end

  def show
    perform User::ShowAction do
      return render json: @action.record
    end
    render_action_error @action
  end

  def update
    perform User::UpdateAction do
      return render json: @action.record
    end
    render_action_error @action
  end

  def destroy
    perform User::DestroyAction do
      return render json: { success: true }
    end
    render_action_error @action
  end

end
