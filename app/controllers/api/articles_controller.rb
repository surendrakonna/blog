class Api::ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    perform Article::CreateAction do
      return render json: @action.record
    end
    render_action_error @action
  end

  def show
    perform Article::ShowAction do
      return render json: @action.record
    end
    render_action_error @action
  end

  def update
    perform Article::UpdateAction do
      return render json: @action.record
    end
    render_action_error @action
  end

  def destroy
    perform Article::DestroyAction do
      return render json: { success: true }
    end
    render_action_error @action
  end

end
