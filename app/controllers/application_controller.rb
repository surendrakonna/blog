class ApplicationController < ActionController::API
  include Authentication
  include ActionPerformer

  before_action :authenticate_user!
end
